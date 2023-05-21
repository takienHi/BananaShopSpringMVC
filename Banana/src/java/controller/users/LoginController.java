/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.users;

import entities.Customer;
import entities.Product;
import entities.ProductImage;
import entities.local.Cart;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.BrandModel;
import model.CategoryModel;
import model.CustomerModel;
import model.ProductImageModel;
import model.ProductModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value = "login")
public class LoginController {

    ProductModel productModel = null;
    CategoryModel catModel = null;
    BrandModel brandModel = null;
    ProductImageModel productImageModel = null;
    CustomerModel customerModel = null;

    public LoginController() {
        productModel = new ProductModel();
        catModel = new CategoryModel();
        brandModel = new BrandModel();
        productImageModel = new ProductImageModel();
        customerModel = new CustomerModel();
    }

    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public String index(Model model, HttpSession session) {
        if (null != session.getAttribute("usercustomer")) {
            return "redirect:/";
        }
        
        if (null != session.getAttribute("cart")) {
            List<Cart> gioHangs = (List<Cart>) session.getAttribute("cart");
            model.addAttribute("soluongsanphamgiohang", gioHangs.size());
        } else {
            model.addAttribute("soluongsanphamgiohang", 0);
        }
        model.addAttribute("products", productModel.getListsProduct());
        model.addAttribute("categories", catModel.getAllCategory());
        model.addAttribute("brands", brandModel.getAllBrand());
        
        return "users/login";
    }

    @RequestMapping(value = "/customerLogin", method = RequestMethod.POST)
    public String loginBackend(String usernamelogin, String passwordlogin, ModelMap mm, HttpSession session) {
        int result = 0;

        result = customerModel.dangNhap(usernamelogin, passwordlogin);
        System.out.println(result);
        if (result == 1) {
            Customer customer = customerModel.getCustomerByUserName(usernamelogin);

            if (customer.isStatus() == true) {
                session.setAttribute("idcustomer", customer.getCustomerId());
                session.setAttribute("usercustomer", customer.getUserName());
                session.setAttribute("fullnamecustomer", customer.getFullName());
                return "redirect:/";
            } else {
                return "redirect:/login";
            }

        } else {
            return "redirect:/login";
        }
    }
    
    @RequestMapping(value = "/dang-ky", method = RequestMethod.POST)
    public String dangKyCus(String fullName, String address, boolean gender, String dateOfBirth, String phoneNumber, String email, String userName, String password) {
        Customer cus = new Customer(fullName, address, gender, dateOfBirth, phoneNumber, email, userName, password, true);
        customerModel.insertCustomer(cus);
        return "redirect:/users/customer-detail";
    }
    
     @RequestMapping(value = "/dang-xuat")
    public String logoutBackend(HttpSession session, ModelMap mm, HttpServletRequest request) {

        if (session.getAttribute("usercustomer") != null) {
            session.removeAttribute("usercustomer");
            session.removeAttribute("idcustomer");
            session.removeAttribute("fullnamecustomer");
        }
        return "redirect:/login";
    }
}

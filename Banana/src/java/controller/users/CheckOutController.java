/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.users;

import entities.Customer;
import entities.OrderDetail;
import entities.Orderr;
import entities.local.Cart;
import java.util.List;
import javax.servlet.http.HttpSession;
import model.BrandModel;
import model.CategoryModel;
import model.CustomerModel;
import model.OrderDetailModel;
import model.OrderModel;
import model.ProductImageModel;
import model.ProductModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author PC
 */
@Controller
@RequestMapping(value = "checkout")
public class CheckOutController {

    ProductModel productModel = null;
    CategoryModel catModel = null;
    BrandModel brandModel = null;
    ProductImageModel productImageModel = null;
    CustomerModel customerModel = null;
    OrderModel orderModel = null;
    OrderDetailModel orderDetailModel = null;

    public CheckOutController() {
        productModel = new ProductModel();
        catModel = new CategoryModel();
        brandModel = new BrandModel();
        productImageModel = new ProductImageModel();
        customerModel = new CustomerModel();
        orderModel = new OrderModel();
        orderDetailModel = new OrderDetailModel();
    }

    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public String index(Model model, HttpSession session) {
        double tongtien = 0;
        String result = "";
        if (null != session.getAttribute("usercustomer")) {
            String customerUserName = (String) session.getAttribute("usercustomer");
            Customer customer = customerModel.getCustomerByUserName(customerUserName);
            model.addAttribute("customer2", customer);
        } else {
            return "redirect:/login";
        }

        if (null != session.getAttribute("cart")) {
            List<Cart> gioHangs = (List<Cart>) session.getAttribute("cart");
            if (gioHangs.size() < 1) {
                return "redirect:/shop";
            }
            model.addAttribute("soluongsanphamgiohang", gioHangs.size());
            for (Cart listCart : gioHangs) {
                tongtien = tongtien + listCart.getThanhTien();
            }
            model.addAttribute("tongtiengiohang", tongtien);
        } else {
                return "redirect:/shop";
        }
        model.addAttribute("products", productModel.getListsProduct());
        model.addAttribute("categories", catModel.getAllCategory());
        model.addAttribute("brands", brandModel.getAllBrand());
        return "users/checkout";
    }

    @RequestMapping(value = "/saveorder", method = RequestMethod.POST)
    public String saveOrder(String fullName, String phoneNumber, String shippingAddress, String note, HttpSession session) {
        Orderr order = null;
        double tongtien = 0;
        if (null != session.getAttribute("usercustomer") && null != session.getAttribute("cart")) {
            int customerId = (int) session.getAttribute("idcustomer");
            List<Cart> gioHangs = (List<Cart>) session.getAttribute("cart");
            for (Cart listCart : gioHangs) {
                tongtien = tongtien + listCart.getThanhTien();
            }
            order = new Orderr(customerId, fullName, phoneNumber, shippingAddress, tongtien, note, 1);
            boolean checkInsert = orderModel.insertOrderr(order);
            int orderIdnew = orderModel.getIdorderIdLatest();
            if (checkInsert && orderIdnew != 0) {
                OrderDetail orderDetail = null;
                for (Cart i : gioHangs) {
                    orderDetail = new OrderDetail(orderIdnew, i.getProductId(), i.getQuantityInCart(), i.getThanhTien());
                    if(orderDetailModel.insertOrderDetail(orderDetail)){
                        productModel.truSoLuongSauCheckOut(orderDetail.getProductId(), customerId);
                    };
                }
            }

            session.removeAttribute("cart");
        } else {
            return "redirect:/login";
        }

        return "redirect:/customer/customer-detail/";
    }
}

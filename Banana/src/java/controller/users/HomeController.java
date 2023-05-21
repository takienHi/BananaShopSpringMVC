/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.users;

import entities.local.Cart;
import java.util.List;
import javax.servlet.http.HttpSession;
import model.BrandModel;
import model.CategoryModel;
import model.ProductImageModel;
import model.ProductModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

    ProductModel productModel = null;
    CategoryModel catModel = null;
    BrandModel brandModel = null;
    ProductImageModel productImageModel = null;

    public HomeController() {
        productModel = new ProductModel();
        catModel = new CategoryModel();
        brandModel = new BrandModel();
        productImageModel = new ProductImageModel();
    }

    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public String index(Model model, HttpSession session) {
        if (null != session.getAttribute("cart")) {
            List<Cart> gioHangs = (List<Cart>) session.getAttribute("cart");
            model.addAttribute("soluongsanphamgiohang", gioHangs.size());
        }else{
            model.addAttribute("soluongsanphamgiohang", 0);
        }
        model.addAttribute("products", productModel.getListsProduct());
        model.addAttribute("categories", catModel.getAllCategory());
        model.addAttribute("brands", brandModel.getAllBrand());
        return "users/index";
    }
}

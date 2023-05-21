/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.users;

import entities.Product;
import entities.ProductImage;
import entities.local.Cart;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import model.BrandModel;
import model.CategoryModel;
import model.ProductImageModel;
import model.ProductModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author PC
 */
@Controller
@RequestMapping(value = "shop")
public class ShopController {

    ProductModel productModel = null;
    CategoryModel catModel = null;
    BrandModel brandModel = null;
    ProductImageModel productImageModel = null;

    public ShopController() {
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
        return "users/shop";
    }
    
    @RequestMapping(value = {"category/{id}"}, method = RequestMethod.GET)
    public String indexdanhmuc(Model model, @PathVariable(value = "id") int id, HttpSession session) {
        if (null != session.getAttribute("cart")) {
            List<Cart> gioHangs = (List<Cart>) session.getAttribute("cart");
            model.addAttribute("soluongsanphamgiohang", gioHangs.size());
        }else{
            model.addAttribute("soluongsanphamgiohang", 0);
        }
        model.addAttribute("products", productModel.getListsProductByCat(id));
        model.addAttribute("categories", catModel.getAllCategory());
        model.addAttribute("brands", brandModel.getAllBrand());
        return "users/shop";
    }
    
    @RequestMapping(value = {"brand/{id}"}, method = RequestMethod.GET)
    public String indexthuonghieu(Model model, @PathVariable(value = "id") int id, HttpSession session) {
        if (null != session.getAttribute("cart")) {
            List<Cart> gioHangs = (List<Cart>) session.getAttribute("cart");
            model.addAttribute("soluongsanphamgiohang", gioHangs.size());
        }else{
            model.addAttribute("soluongsanphamgiohang", 0);
        }
        model.addAttribute("products", productModel.getListsProductByBrand(id));
        model.addAttribute("categories", catModel.getAllCategory());
        model.addAttribute("brands", brandModel.getAllBrand());
        return "users/shop";
    }

    @RequestMapping(value = {"/detail-product/{id}"}, method = RequestMethod.GET)
    public String detailProduct(Model model, @PathVariable(value = "id") int id, HttpSession session) {
        if (null != session.getAttribute("cart")) {
            List<Cart> gioHangs = (List<Cart>) session.getAttribute("cart");
            model.addAttribute("soluongsanphamgiohang", gioHangs.size());
        }else{
            model.addAttribute("soluongsanphamgiohang", 0);
        }
        model.addAttribute("prodetail", productModel.getProductById2(id));
        model.addAttribute("imagedetail", productImageModel.getListImageByProductId(id));
        model.addAttribute("products", productModel.getListsProduct());
        model.addAttribute("categories", catModel.getAllCategory());
        model.addAttribute("brands", brandModel.getAllBrand());
        return "users/detail-product";
    }

    
}

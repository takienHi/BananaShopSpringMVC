/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.users;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import unit.XuLyTien;

/**
 *
 * @author PC
 */
@Controller
@RequestMapping(value = "cart")
public class CartController {

    ProductModel productModel = null;
    CategoryModel catModel = null;
    BrandModel brandModel = null;
    ProductImageModel productImageModel = null;

    public CartController() {
        productModel = new ProductModel();
        catModel = new CategoryModel();
        brandModel = new BrandModel();
        productImageModel = new ProductImageModel();
    }

    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public String index(Model model, HttpSession session) {
        double tongtien = 0;
        String result = "";
        if (null != session.getAttribute("cart")) {
            List<Cart> gioHangs = (List<Cart>) session.getAttribute("cart");
            model.addAttribute("soluongsanphamgiohang", gioHangs.size());
            for (Cart listCart : gioHangs) {
                tongtien = tongtien + listCart.getThanhTien();
            }
            model.addAttribute("tongtiengiohang", tongtien);
        } else {
            model.addAttribute("soluongsanphamgiohang", 0);
            model.addAttribute("tongtiengiohang", tongtien);
        }
        model.addAttribute("products", productModel.getListsProduct());
        model.addAttribute("categories", catModel.getAllCategory());
        model.addAttribute("brands", brandModel.getAllBrand());
        return "users/cart";
    }

    @RequestMapping(value = {"/themgiohang"}, method = RequestMethod.GET)
    @ResponseBody
    public int themgiohang(@RequestParam int maSp, @RequestParam String tensp, @RequestParam double giaTien,
            @RequestParam String anh, @RequestParam int soLuong, HttpSession httpSession) {

        if (null == httpSession.getAttribute("cart")) {
            List<Cart> giohangs = new ArrayList<>();
            Cart cart = new Cart();
            cart.setProductId(maSp);
            cart.setProductName(tensp);
            cart.setPrice(giaTien);
            cart.setQuantityInCart(1);
            cart.setImage(anh);

            giohangs.add(cart);
            httpSession.setAttribute("cart", giohangs);
        } else {
            List<Cart> listCarts = (List<Cart>) httpSession.getAttribute("cart");
            int vitri = kiemTraSPTonTaiCart(listCarts, httpSession, maSp);
            if (vitri == -1) {
                Cart cart = new Cart();
                cart.setProductId(maSp);
                cart.setProductName(tensp);
                cart.setPrice(giaTien);
                cart.setQuantityInCart(1);
                cart.setImage(anh);

                listCarts.add(cart);
            } else {
                int soluongMoi = listCarts.get(vitri).getQuantityInCart() + 1;
                listCarts.get(vitri).setQuantityInCart(soluongMoi);
            }

        }
        List<Cart> listCarts = (List<Cart>) httpSession.getAttribute("cart");
        for (Cart cart : listCarts) {
        }
        int productsInCart = listCarts.size();
        return productsInCart;
    }

    private int kiemTraSPTonTaiCart(List<Cart> listCarts, HttpSession httpSession, int masp) {
        for (int i = 0; i < listCarts.size(); i++) {
            if (listCarts.get(i).getProductId() == masp) {
                return i;
            }
        }
        return -1;
    }
    
    @RequestMapping(value = {"cap-nhat"}, method = RequestMethod.GET)
    @ResponseBody
    public String capnhatcart(@RequestParam int masp, @RequestParam int soluongmoi, HttpSession session) {
        String result = "";
        if (null != session.getAttribute("cart")) {
            List<Cart> listCarts = (List<Cart>) session.getAttribute("cart");
            for (int i = 0; i < listCarts.size(); i++) {
                if (listCarts.get(i).getProductId() == masp) {
                    listCarts.get(i).setQuantityInCart(soluongmoi);
                    result = listCarts.get(i).gethanhTienString();
                }
            }
        }
        return result;
    }
    
    @RequestMapping(value = {"tong-tien"}, method = RequestMethod.GET)
    @ResponseBody
    public String tongtiencart(HttpSession session) {
        String result = "";
        double tongtien = 0;
        if (null != session.getAttribute("cart")) {
            List<Cart> listCarts = (List<Cart>) session.getAttribute("cart");
            
            for (Cart listCart : listCarts) {
                tongtien = tongtien + listCart.getThanhTien();
            }
            result = XuLyTien.dinhDangTien(tongtien);
        }
        return result;
    }

    @RequestMapping(value = {"xoagiohang"}, method = RequestMethod.GET)
    @ResponseBody
    private int xoagiohang(HttpSession session, @RequestParam int id) {
        if (null != session.getAttribute("cart")) {
            List<Cart> gioHangs = (List<Cart>) session.getAttribute("cart");

            int vitri = kiemTraSPTonTaiCart(gioHangs, session, id);

            gioHangs.remove(vitri);
        }
        List<Cart> listCarts = (List<Cart>) session.getAttribute("cart");
        for (Cart cart : listCarts) {
        }
        int productsInCart = listCarts.size();
        return productsInCart;
    }
}

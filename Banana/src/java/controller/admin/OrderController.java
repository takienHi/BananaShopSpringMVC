/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import entities.OrderDetail;
import entities.Orderr;
import java.util.List;
import javax.servlet.http.HttpSession;
import model.CustomerModel;
import model.OrderDetailModel;
import model.OrderModel;
import model.ProductModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author PC
 */
@Controller
@RequestMapping(value = "admin/order")
public class OrderController {
LoginAdminController ckLogin = new LoginAdminController();
    CustomerModel customerModel = null;
    OrderModel orderModel = null;
    OrderDetailModel orderDetailModel = null;
    ProductModel productModel = null;

    public OrderController() {
        customerModel = new CustomerModel();
        orderModel = new OrderModel();
        orderDetailModel = new OrderDetailModel();
        productModel = new ProductModel();
    }

    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public String index(Model model, HttpSession session) {
        if (!ckLogin.isARole()) {
            return "redirect:/admin/login";
        }
        model.addAttribute("orders", orderModel.getAllOrderr());
        return "admin/order";
    }

    @RequestMapping(value = "/duyetdon/{id}", method = RequestMethod.GET)
    public String duyetdon(Model model, @PathVariable(value = "id") int id, HttpSession session) {
        List<OrderDetail> orderDetails = orderDetailModel.getOrderDetailById(id);

        if (orderModel.updateOrderr(id, 2)) {
            for (OrderDetail orderDetail : orderDetails) {
                System.out.println(orderDetail.toString());
                productModel.truSoLuongSauCheckOut(orderDetail.getProductId(), orderDetail.getQuantity());
            }
        }
        return "redirect:/admin/order";
    }
    
    @RequestMapping(value = "/giaohang/{id}", method = RequestMethod.GET)
    public String giaohang(Model model, @PathVariable(value = "id") int id, HttpSession session) {
        List<OrderDetail> orderDetails = orderDetailModel.getOrderDetailById(id);
        orderModel.updateOrderr(id, 3);
        return "redirect:/admin/order";
    }
    
    @RequestMapping(value = "/huydon/{id}/{status}", method = RequestMethod.GET)
    public String huydon(Model model, @PathVariable(value = "id") int id, @PathVariable(value = "status") int status, HttpSession session) {
        
        if (status != 1) {
            List<OrderDetail> orderDetails = orderDetailModel.getOrderDetailById(id);
            for (OrderDetail orderDetail : orderDetails) {
                System.out.println(orderDetail.toString());
                productModel.themSoLuongSP(orderDetail.getProductId(), orderDetail.getQuantity());
            }
        }
        orderModel.updateOrderr(id, 0);
        return "redirect:/admin/order";
    }
    
    @RequestMapping(value = "/order-detail/{id}", method = RequestMethod.GET)
    public String orderdetail(Model model, @PathVariable(value = "id") int id, HttpSession session) {
        model.addAttribute("orderr", orderModel.getOrderrById(id));
        model.addAttribute("orderDetails", orderDetailModel.getOrderDetailById(id));

        
        return "admin/order-detail";
    }
}

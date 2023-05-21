/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.users;

import entities.Customer;
import entities.local.Cart;
import java.util.List;
import javax.servlet.http.HttpSession;
import model.CustomerModel;
import model.OrderDetailModel;
import model.OrderModel;
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
@RequestMapping(value = "customer")
public class CustomerController {

    CustomerModel customerModel = null;
    OrderModel orderModel = null;
    OrderDetailModel orderDetailModel = null;
    public CustomerController() {
        customerModel = new CustomerModel();
        orderModel = new OrderModel();
        orderDetailModel = new OrderDetailModel();
    }

    @RequestMapping(value = "/checkcus", method = RequestMethod.GET)
    @ResponseBody
    public boolean checkcus(@RequestParam String strCheck, @RequestParam String name) {
        boolean check = customerModel.checkCusUnique(strCheck, name) > 0;
        return check;
    }

    @RequestMapping(value = "/orderdetail/{id}", method = RequestMethod.GET)
    public String orderdetail(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("orderr", orderModel.getOrderrById(id));
        model.addAttribute("orderDetails", orderDetailModel.getOrderDetailById(id));
        return "users/order-detail";
    }
    
    @RequestMapping(value = "/customer-detail", method = RequestMethod.GET)
    public String getcustomerdetail(Model model, HttpSession session) {
        if (null != session.getAttribute("usercustomer")) {
            String customerUserName = (String) session.getAttribute("usercustomer");
            Customer customer = customerModel.getCustomerByUserName(customerUserName);
            model.addAttribute("ordercustomer", orderModel.getOrderrByCustomerId(customer.getCustomerId()));
            model.addAttribute("customer2", customer);
        } else {
            return "redirect:/login";
        }
        
        if (null != session.getAttribute("cart")) {
            List<Cart> gioHangs = (List<Cart>) session.getAttribute("cart");
            model.addAttribute("soluongsanphamgiohang", gioHangs.size());
        } else {
            model.addAttribute("soluongsanphamgiohang", 0);
        }
        return "users/customer-detail";
    }
}

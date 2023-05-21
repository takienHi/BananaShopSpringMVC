/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import javax.servlet.http.HttpSession;
import model.CustomerModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author PC
 */
@Controller
@RequestMapping(value = "admin/customer")
public class CustomerAdController {
    LoginAdminController ckLogin = new LoginAdminController();
    CustomerModel customerModel = null;

    public CustomerAdController() {
        customerModel = new CustomerModel();
    }
    
    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public String index(Model model, HttpSession session) {
        if (!ckLogin.isARole()) {
            return "redirect:/admin/login";
        }
        model.addAttribute("customers", customerModel.getAllCustomer());
        return "admin/customer";
    }
    
    @RequestMapping(value = "/updateCusStatus", method = RequestMethod.POST)
    public String updateCusStatus(int customerId,boolean status) {
        
        customerModel.updateCusStatus(customerId, status);
        return "redirect:/admin/customer/";
    }
}

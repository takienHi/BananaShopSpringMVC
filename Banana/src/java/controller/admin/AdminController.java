/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "admin")
public class AdminController {
    LoginAdminController ckLogin = new LoginAdminController();
    
    public AdminController() {
    }

    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public String index(Model model,HttpSession session) {
        if (ckLogin.isARole()) {
            return "admin/index";
        }else{
            return "redirect:/admin/login";
        }
        
    }
}

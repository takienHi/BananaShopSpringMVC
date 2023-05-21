/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import entities.Employee;
import entities.ssUser;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.EmployeeModel;
import model.RoleModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 *
 * @author PC
 */
@Controller
@RequestMapping(value = "admin")
public class LoginAdminController {

    EmployeeModel employeeModel = null;
    RoleModel roleModel = null;

    public LoginAdminController() {
        employeeModel = new EmployeeModel();
        roleModel = new RoleModel();
    }

    @RequestMapping(value = {"/login", "/login/"}, method = RequestMethod.GET)
    public String initBackendLogin(Model model) {

        return "admin/login";
    }

    @RequestMapping(value = "/backendLogin", method = RequestMethod.POST)
    public String loginBackend(String username, String password, ModelMap mm, HttpSession session) {
        int result = 0;

        result = employeeModel.loginAdmin(username, password);

        if (result == 1) {
            Employee employee = employeeModel.getEmployeeByUserName(username);

            if (employee.isStatus() == true) {
                session.setAttribute("user", employee.getUserName());
                session.setAttribute("role", employee.getRoleId());
                session.setAttribute("fullname", employee.getFullName());
                session.setAttribute("address", employee.getAddress());
                return "redirect:/admin/";
            } else {
                mm.put("message", "tài khoản của bạn đã bị khóa");
                return "redirect:/admin/login";
            }

        } else {
            mm.put("message", "Sai thông tin đăng nhập.");
            return "redirect:/admin/login";
        }
    }

    public boolean isAdmin() {
        ssUser u = getssUser();

        return u.getSsRole() == 1;
    }

    public boolean isManager() {
        ssUser u = getssUser();

        return u.getSsRole() == 2;
    }

    public boolean isSales() {
        ssUser u = getssUser();

        return u.getSsRole() == 3;
    }
    
    public boolean isARole() {
        ssUser u = getssUser();
        
        return u.getSsRole() == 1 || u.getSsRole() == 2 || u.getSsRole() == 3;
    }

    public ssUser getssUser() {
        RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
        ServletRequestAttributes attributes = (ServletRequestAttributes) requestAttributes;
        HttpServletRequest request = attributes.getRequest();
        HttpSession httpSession = request.getSession(true);
        if (httpSession.getAttribute("user") != null && httpSession.getAttribute("role") != null && httpSession.getAttribute("fullname") != null) {
            String ssUser = (String) httpSession.getAttribute("user");
            int ssRole = (int) httpSession.getAttribute("role");
            String ssFullName = (String) httpSession.getAttribute("fullname");
            ssUser u = new ssUser(ssUser, ssRole, ssFullName);
            return u;
        }else{
            ssUser u = new ssUser("0", 0, "0");
            return u;
        }
    }

    @RequestMapping(value = "/logoutBackend")
    public String logoutBackend(HttpSession session, ModelMap mm, HttpServletRequest request) {

        if (session.getAttribute("user") != null) {
            session.removeAttribute("user");
            session.removeAttribute("role");
            session.removeAttribute("fullname");
        }
        return "redirect:/admin/login";
    }
}

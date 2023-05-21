/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import entities.Employee;
import entities.Role;
import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.EmployeeModel;
import model.RoleModel;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author PC
 */
@Controller
@RequestMapping(value = "admin/employee")
public class EmployeeController {
LoginAdminController ckLogin = new LoginAdminController();
    EmployeeModel employeeModel = null;
    RoleModel roleModel = null;

    public EmployeeController() {
        employeeModel = new EmployeeModel();
        roleModel = new RoleModel();
    }

    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public String index(Model model, HttpSession session) {
        if (!ckLogin.isARole()) {
            return "redirect:/admin/login";
        }
        model.addAttribute("employees", employeeModel.getAllEmployee2());
        model.addAttribute("roles", roleModel.getAllRole());
        return "admin/employee";
    }

    @RequestMapping(value = "/saveEmp", method = RequestMethod.POST)
    public String saveEmp(int roleId, String fullName, String address, boolean gender, String dateOfBirth, String phone, String email, String userName, String password, MultipartFile employeeImage, HttpServletRequest req, String oldEmployeeImage) {
        String linkImage = "";
        if (employeeImage.getSize() != 0) {
            linkImage = saveImage(employeeImage, req);
        }
        Employee emp = new Employee(roleId, fullName, address, gender, dateOfBirth, phone, email, userName, password, linkImage, gender);
        employeeModel.insertEmployee(emp);
        return "redirect:/admin/employee/";
    }
    
    @RequestMapping(value = "/updateEmp", method = RequestMethod.POST)
    public String updateEmp(int employeeId,int roleId, String fullName, String address, boolean gender, String dateOfBirth, String phone, String email, MultipartFile employeeImage,boolean status, HttpServletRequest req, String employeeImagecu) {
        String linkImage = "";
        if (employeeImage.getSize() != 0) {
            linkImage = saveImage(employeeImage, req);
            System.out.println("hi");
        }else{
            System.out.println("hi2");
            linkImage = employeeImagecu;
        }
        Employee emp = new Employee(employeeId,roleId, fullName, address, gender, dateOfBirth, phone, email, linkImage, status);
        employeeModel.updateEmployee2(emp);
        return "redirect:/admin/employee/";
    }

    @RequestMapping(value = "/checkEmp", method = RequestMethod.GET)
    @ResponseBody
    public boolean checkEmp(@RequestParam String strCheck, @RequestParam String name) {
        boolean check = employeeModel.checkEmpUnique(strCheck, name) > 0;
        return check;
    }

    public String saveImage(@RequestParam(value = "files") MultipartFile file, HttpServletRequest req) {

        String newFilename = "";
        String fileExtension = "";
        int idAnhMoiNhat = employeeModel.getIdEmployeeIdLatest();
        //upload ảnh
        try {
            idAnhMoiNhat++;
            String uploadRootPath = req.getServletContext().getRealPath("images/employee");

            fileExtension = "." + FilenameUtils.getExtension(file.getOriginalFilename());

            newFilename = "anh" + idAnhMoiNhat + fileExtension;

            File destination2 = new File(uploadRootPath + "\\" + newFilename);

            file.transferTo(destination2);

        } catch (IOException | IllegalStateException ex) {
            Logger.getLogger(BrandController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return newFilename;
    }
}

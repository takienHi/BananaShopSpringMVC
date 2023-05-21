/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import entities.Category;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.CategoryModel;
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
@RequestMapping(value = "admin/category")
public class CategoryController {
LoginAdminController ckLogin = new LoginAdminController();
    CategoryModel catModel = null;

    public CategoryController() {
        catModel = new CategoryModel();
    }

    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public String index(Model model, HttpSession session) {
        if (!ckLogin.isARole()) {
            return "redirect:/admin/login";
        }
        model.addAttribute("categories", catModel.getAllCategory());
        return "admin/category";
    }

    @RequestMapping(value = "/saveCat", method = RequestMethod.POST)
    public String saveCat(int categoryId, String categoryName, boolean status, HttpServletRequest req) {

        if (categoryId == 0) {
            Category ca = new Category(categoryName, status);
            catModel.insertCategory(ca);
        } else {
            Category ca = new Category(categoryId, categoryName, status);
            catModel.updateCategory(ca);
        }
        return "redirect:/admin/category/";
    }

    
    @RequestMapping(value = {"delete/{id}", "delete/{id}/"}, method = RequestMethod.GET)
    public String delete(Model model,@PathVariable(value = "id") int categoryId, HttpSession session) {
        int check = catModel.checkCategoryIdInProduct(categoryId);
        if (check == 0) {
            
            catModel.deleteCategory(categoryId);
            session.setAttribute("deleteAlert", 2);
        }else{
            session.setAttribute("deleteAlert", 1);
        }
        
        return "redirect:/admin/category/";
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import entities.Brand;
import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.BrandModel;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author PC
 */
@Controller
@RequestMapping(value = "admin/brand")
public class BrandController {
    LoginAdminController ckLogin = new LoginAdminController();
    BrandModel brandModel = null;

    public BrandController() {
        brandModel = new BrandModel();
    }

    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public String index(Model model, HttpSession session) {
        if (!ckLogin.isARole()) {
            return "redirect:/admin/login";
        }
        model.addAttribute("brands", brandModel.getAllBrand());
        return "admin/brand";
    }

    @RequestMapping(value = "/saveBrand", method = RequestMethod.POST)
    public String saveBrand(int brandId, String brandName, boolean status, MultipartFile brandImage, HttpServletRequest req, String oldBrandImage) {

        if (brandId == 0) {
            String linkImage = "";
            if (brandImage.getSize() == 0) {
                linkImage = oldBrandImage;
            } else {
                linkImage = saveImages(brandImage, req);
            }
            Brand ca = new Brand(brandName, linkImage, status);
            brandModel.insertBrand(ca);
        } else {
            String linkImage = "";
            if (brandImage.getSize() == 0) {
                linkImage = oldBrandImage;
            } else {
                linkImage = saveImages(brandImage, req);
            }
            Brand ca = new Brand(brandId, brandName, linkImage, status);
            brandModel.updateBrand(ca);
        }
        return "redirect:/admin/brand/";
    }

    public String saveImages(@RequestParam(value = "files") MultipartFile file, HttpServletRequest req) {

        String newFilename = "";
        String fileExtension = "";
        int idAnhMoiNhat = brandModel.getIdBrandIdLatest();
        //upload ảnh
        try {
            idAnhMoiNhat++;
            String uploadRootPath = req.getServletContext().getRealPath("images/brand");

            fileExtension = "." + FilenameUtils.getExtension(file.getOriginalFilename());

            newFilename = "anh" + idAnhMoiNhat + fileExtension;

            File destination2 = new File(uploadRootPath + "\\" + newFilename);

            file.transferTo(destination2);

        } catch (IOException | IllegalStateException ex) {
            Logger.getLogger(BrandController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return newFilename;
    }
    
    @RequestMapping(value = {"delete/{id}", "delete/{id}/"}, method = RequestMethod.GET)
    public String delete(Model model,@PathVariable(value = "id") int brandId, HttpSession session) {
        brandModel.deleteBrand(brandId);
        return "redirect:/admin/brand/";
    }
}

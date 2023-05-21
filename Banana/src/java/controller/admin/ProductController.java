/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import entities.Product;
import entities.ProductImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.BrandModel;
import model.CategoryModel;
import model.ProductImageModel;
import model.ProductModel;
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
@RequestMapping(value = "admin/product")
public class ProductController {
LoginAdminController ckLogin = new LoginAdminController();
    ProductModel productModel = null;
    CategoryModel catModel = null;
    BrandModel brandModel = null;
    ProductImageModel productImageModel = null;

    String currentDate = new SimpleDateFormat("dd-MM-yyyy").format(new Date());

    public ProductController() {
        productModel = new ProductModel();
        catModel = new CategoryModel();
        brandModel = new BrandModel();
        productImageModel = new ProductImageModel();
    }

    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public String index(Model model, HttpSession session) {
if (!ckLogin.isARole()) {
            return "redirect:/admin/login";
        }
        model.addAttribute("products", productModel.getListsProduct());
        model.addAttribute("categories", catModel.getAllCategory());
        model.addAttribute("brands", brandModel.getAllBrand());
        return "admin/product";
    }

    @RequestMapping(value = {"/detail-product/{id}"}, method = RequestMethod.GET)
    public String detailProduct(Model model, @PathVariable(value = "id") int id, HttpSession session) {
        model.addAttribute("prodetail", productModel.getProductById2(id));
        model.addAttribute("imagedetail", productImageModel.getListImageByProductId(id));
        model.addAttribute("products", productModel.getListsProduct());
        model.addAttribute("categories", catModel.getAllCategory());
        model.addAttribute("brands", brandModel.getAllBrand());
        return "admin/productdetail";
    }

    @RequestMapping(value = {"/detail-Product"}, method = RequestMethod.GET)
    public String detailProduct2(Model model, HttpSession session) {
        return "admin/productdetail";
    }

    @RequestMapping(value = "/saveProduct", method = RequestMethod.POST)
    public String saveProduct(int categoryId, int brandId, int quantity, double price, String productName, boolean status, @RequestParam(value = "productImage") MultipartFile[] productImage, String description, HttpServletRequest req) {

        ArrayList<String> fileNames = new ArrayList<>();
        if (productImage.length != 0) {
            fileNames = saveImages(productImage, req);
        }
        Product ca = new Product(categoryId, brandId, productName, price, quantity, currentDate, currentDate, description, status);
        int newId = productModel.insertProduct(ca);
        if (newId != 0) {
            int i = 1;
            for (String fileName : fileNames) {

                if (i == 1) {
                    ProductImage productImage2 = new ProductImage(newId, fileName, true);
                    productImageModel.insertProductImage(productImage2);
                    i = 2;
                } else {
                    ProductImage productImage2 = new ProductImage(newId, fileName, false);
                    productImageModel.insertProductImage(productImage2);
                }
            }

        }

        return "redirect:/admin/product";
    }

    public ArrayList saveImages(MultipartFile[] files, HttpServletRequest req) {

        ArrayList<String> fileNames = new ArrayList<>();
        String newFilename = "";
        String fileExtension = "";
        int idAnhMoiNhat = productImageModel.getIdProductImageIdLatest();
        //upload ảnh
        for (MultipartFile file : files) {
            idAnhMoiNhat++;
                try {
                    String uploadRootPath = req.getServletContext().getRealPath("images/product");

                    fileExtension = "." + FilenameUtils.getExtension(file.getOriginalFilename());

                    newFilename = "anhdetail" + idAnhMoiNhat + fileExtension;

                    File destination2 = new File(uploadRootPath + "\\" + newFilename);

                    file.transferTo(destination2);

                    fileNames.add(newFilename);
                } catch (IOException | IllegalStateException ex) {
                    Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
                }
        }
        return fileNames;
    }

    @RequestMapping(value = "/updatePro", method = RequestMethod.POST)
    public String updateProduct(int productId, int categoryId, int brandId, double price, String productName, boolean status, HttpSession session) {
        System.out.println("Product{" + "productId=" + productId + ", categoryId=" + categoryId + ", brandId=" + brandId + ", productName=" + productName + ", price=" + price + ", status=" + status + '}');
        Product pro = new Product(productId, categoryId, brandId, productName, price, currentDate, status);

        if (productModel.updateProduct2(pro)) {

            session.setAttribute("updateAlert", 2);
        } else {
            session.setAttribute("updateAlert", 1);
        }
        String goUrl = "redirect:/admin/product/detail-product/" + productId;
        return goUrl;
    }

    @RequestMapping(value = "/addQuantityPro", method = RequestMethod.POST)
    public String themSoLuongSP(int productId, int quantity, HttpSession session) {
        if (productModel.themSoLuongSP(productId, quantity)) {

            session.setAttribute("updateAlert", 2);
        } else {
            session.setAttribute("updateAlert", 1);
        }
        String goUrl = "redirect:/admin/product/detail-product/" + productId;
        return goUrl;
    }

    @RequestMapping(value = "/updateSingleImage", method = RequestMethod.POST)
    public String updateSingleImage(MultipartFile file, int imgId, int productId, String linkImage, boolean isMain, HttpServletRequest req, HttpSession session) {
        ProductImage productImage = new ProductImage(imgId, productId, linkImage, isMain);
        String newFileName = updateImage(file, productImage, req);
        if (!"".equals(newFileName)) {
            ProductImage productImage2 = new ProductImage(imgId, productId, newFileName, isMain);
            productImageModel.updateProductImage2(productImage2);
            session.setAttribute("updateAlert", 2);
        } else {
            session.setAttribute("updateAlert", 1);
        }
        String goUrl = "redirect:/admin/product/detail-product/" + productId;
        return goUrl;
    }

    @RequestMapping(value = "/deleteSingleImage", method = RequestMethod.POST)
    public String deleteSingleImage(MultipartFile file, int imgId, int productId, String linkImage, boolean isMain, HttpServletRequest req, HttpSession session) {
        ProductImage productImage = new ProductImage(imgId, productId, linkImage, isMain);

        if (!isMain && productImageModel.deleteProductImage(imgId)) {
            deleteAnh(productImage.getLinkImage(), req);
            session.setAttribute("deleteAlert", 2);
        } else {
            session.setAttribute("deleteAlert", 1);
        }
        String goUrl = "redirect:/admin/product/detail-product/" + productId;
        return goUrl;
    }

    @RequestMapping(value = {"delete/{id}", "delete/{id}/"}, method = RequestMethod.GET)
    public String deletePro(Model model, @PathVariable(value = "id") int productId, HttpSession session, HttpServletRequest req) {
        int check = productModel.checkProductExistInOrderDetail(productId);
        if (check == 0) {
            List<ProductImage> listImgs = productImageModel.getListImageByProductId(productId);
            for (ProductImage listImg : listImgs) {
                String tenAnhCu = listImg.getLinkImage();
                System.out.println("anh:" + tenAnhCu);
                deleteAnh(tenAnhCu, req);

            }
            boolean check2 = productImageModel.deleteAllImageByProductId(productId);
            if (check2) {
                Product pro = productModel.getProductById(productId);
                productModel.deletePro(productId);
            }

            session.setAttribute("deleteAlert", 2);
        } else {
            session.setAttribute("deleteAlert", 1);
        }

        return "redirect:/admin/product/";
    }

    public boolean deleteAnh(String tenAnhCu, HttpServletRequest req) {
        String uploadRootPath = req.getServletContext().getRealPath("images/product");
        File filecu = new File(uploadRootPath + "\\" + tenAnhCu);

        if (filecu.exists()) {
            filecu.delete();
            return true;
        }
        return false;
    }

    public String updateImage(MultipartFile file, ProductImage productImage, HttpServletRequest req) {

        String fileNames = "";
        String newFilename = "";
        String fileExtension = "";
        //upload ảnh
        try {
            String uploadRootPath = req.getServletContext().getRealPath("images/product");

            fileExtension = "." + FilenameUtils.getExtension(file.getOriginalFilename());
            deleteAnh(productImage.getLinkImage(), req);
            if (productImage.isIsMain()) {
                newFilename = "anhproduct" + productImage.getImgId() + fileExtension;
            } else {
                newFilename = "anhdetail" + productImage.getImgId() + fileExtension;
            }

            File destination2 = new File(uploadRootPath + "\\" + newFilename);

            file.transferTo(destination2);
            fileNames = newFilename;
        } catch (IOException | IllegalStateException ex) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fileNames;
    }

    @RequestMapping(value = "/updateAllImages", method = RequestMethod.POST)
    public String updateImages(int productId, @RequestParam(value = "productImage") MultipartFile[] productImage, HttpServletRequest req) {

        List<ProductImage> listImgs = productImageModel.getListImageByProductId(productId);
        for (ProductImage listImg : listImgs) {
            String tenAnhCu = listImg.getLinkImage();
            deleteAnh(tenAnhCu, req);
        }
        boolean check2 = productImageModel.deleteAllImageByProductId(productId);
        ArrayList<String> fileNames = new ArrayList<>();
        if (productImage.length != 0) {
            fileNames = saveImages(productImage, req);
        }
        if (check2) {
            int i = 1;
            for (String fileName : fileNames) {

                if (i == 1) {
                    ProductImage productImage2 = new ProductImage(productId, fileName, true);
                    productImageModel.insertProductImage(productImage2);
                    i = 2;
                } else {
                    ProductImage productImage2 = new ProductImage(productId, fileName, false);
                    productImageModel.insertProductImage(productImage2);
                }
            }

        }

        String goUrl = "redirect:/admin/product/detail-product/" + productId;
        return goUrl;
    }
    
    @RequestMapping(value = "/updatedescription", method = RequestMethod.POST)
    public String updatedescription(int productId, String description, HttpServletRequest req) {
        
        productModel.updateDescriptionSP(productId, description);
        String goUrl = "redirect:/admin/product/detail-product/" + productId;
        return goUrl;
    }
}

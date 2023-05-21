/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.util.List;

/**
 *
 * @author PC
 */
public class Product {

    private int productId;
    private int categoryId;
    private int brandId;
    private String productName;
    private double price;
    private int quantity;
    private String addedDate;
    private String updateDate;
    private String description;
    private boolean status;
    
    private String categoryName;
    private String brandName;
    private String image;
    private List<ProductImage> listImage;
    

    public Product() {
    }

    public Product(int productId, int categoryId, int brandId, String productName, double price, int quantity, String addedDate, String updateDate, String description, boolean status) {
        this.productId = productId;
        this.categoryId = categoryId;
        this.brandId = brandId;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.addedDate = addedDate;
        this.updateDate = updateDate;
        this.description = description;
        this.status = status;
    }

    public Product(int categoryId, int brandId, String productName, double price, int quantity, String addedDate, String updateDate, String description, boolean status) {
        this.categoryId = categoryId;
        this.brandId = brandId;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.addedDate = addedDate;
        this.updateDate = updateDate;
        this.description = description;
        this.status = status;
    }

    public Product(int productId, int categoryId, int brandId, String productName, double price, int quantity, String addedDate, String updateDate, String description, boolean status, String categoryName, String brandName) {
        this.productId = productId;
        this.categoryId = categoryId;
        this.brandId = brandId;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.addedDate = addedDate;
        this.updateDate = updateDate;
        this.description = description;
        this.status = status;
        this.categoryName = categoryName;
        this.brandName = brandName;
    }

    
    
    public Product(int productId, int categoryId, int brandId, String productName, double price, int quantity, String addedDate, String updateDate, String description, boolean status, String categoryName, String brandName, String image) {
        this.productId = productId;
        this.categoryId = categoryId;
        this.brandId = brandId;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.addedDate = addedDate;
        this.updateDate = updateDate;
        this.description = description;
        this.status = status;
        this.categoryName = categoryName;
        this.brandName = brandName;
        this.image = image;
    }

    public Product(int productId, int categoryId, int brandId, String productName, double price, int quantity, String updateDate, boolean status) {
        this.productId = productId;
        this.categoryId = categoryId;
        this.brandId = brandId;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.updateDate = updateDate;
        this.status = status;
    }

    public Product(int productId, int categoryId, int brandId, String productName, double price, int quantity, String addedDate, String updateDate, String description, boolean status, String categoryName, String brandName, List<ProductImage> listImage) {
        this.productId = productId;
        this.categoryId = categoryId;
        this.brandId = brandId;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.addedDate = addedDate;
        this.updateDate = updateDate;
        this.description = description;
        this.status = status;
        this.categoryName = categoryName;
        this.brandName = brandName;
        this.listImage = listImage;
    }

    public Product(int productId, int categoryId, int brandId, String productName, double price, String updateDate, boolean status) {
        this.productId = productId;
        this.categoryId = categoryId;
        this.brandId = brandId;
        this.productName = productName;
        this.price = price;
        this.updateDate = updateDate;
        this.status = status;
    }

    
  
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getBrandId() {
        return brandId;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getAddedDate() {
        return addedDate;
    }

    public void setAddedDate(String addedDate) {
        this.addedDate = addedDate;
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public List<ProductImage> getListImage() {
        return listImage;
    }

    public void setListImage(List<ProductImage> listImage) {
        this.listImage = listImage;
    }
    
    

    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", categoryId=" + categoryId + ", brandId=" + brandId + ", productName=" + productName + ", price=" + price + ", quantity=" + quantity + ", addedDate=" + addedDate + ", updateDate=" + updateDate +"\n"+ ", description=" + description +"\n"+ ", status=" + status + '}';
    }

    
}

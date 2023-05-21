/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author PC
 */
public class ProductImage {

    private int imgId;
    private int productId;
    private String linkImage;
    private boolean isMain;

    public ProductImage() {
    }

   

    public ProductImage(int imgId, int productId, String linkImage, boolean isMain) {
        this.imgId = imgId;
        this.productId = productId;
        this.linkImage = linkImage;
        this.isMain = isMain;
    }

    public ProductImage(int productId, String linkImage, boolean isMain) {
        this.productId = productId;
        this.linkImage = linkImage;
        this.isMain = isMain;
    }
    
    public int getImgId() {
        return imgId;
    }

    public void setImgId(int imgId) {
        this.imgId = imgId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    

    public String getLinkImage() {
        return linkImage;
    }

    public void setLinkImage(String linkImage) {
        this.linkImage = linkImage;
    }

    public boolean isIsMain() {
        return isMain;
    }

    public void setIsMain(boolean isMain) {
        this.isMain = isMain;
    }

    
}

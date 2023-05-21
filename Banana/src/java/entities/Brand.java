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
public class Brand {

    private int brandId;
    private String brandName;
    private String brandImage;
    private boolean status;

    public Brand() {
    }

    public Brand(int brandId, String brandName, String brandImage, boolean status) {
        this.brandId = brandId;
        this.brandName = brandName;
        this.brandImage = brandImage;
        this.status = status;
    }

    public Brand(String brandName, String brandImage, boolean status) {
        this.brandName = brandName;
        this.brandImage = brandImage;
        this.status = status;
    }

    public int getBrandId() {
        return brandId;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getBrandImage() {
        return brandImage;
    }

    public void setBrandImage(String brandImage) {
        this.brandImage = brandImage;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}

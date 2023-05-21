/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities.local;

import java.io.Serializable;
import unit.XuLyTien;

/**
 *
 * @author PC
 */
public class Cart implements Serializable {

    private static final long serialVersionUID = 1L;
    private int productId;
    private String productName;
    private double price;
    private String image;
    private int quantityInCart;

    public Cart() {
    }

    public Cart(int productId, String productName, double price, String image, int quantityInCart) {
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.image = image;
        this.quantityInCart = quantityInCart;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQuantityInCart() {
        return quantityInCart;
    }

    public void setQuantityInCart(int quantityInCart) {
        this.quantityInCart = quantityInCart;
    }

    @Override
    public String toString() {
        return "Cart{" + "productId=" + productId + ", productName=" + productName + ", price=" + price + ", image=" + image + ", quantityInCart=" + quantityInCart + '}';
    }

    public double getThanhTien() {
        return this.price * this.quantityInCart;
    }
    
    public String gethanhTienString() {
        return XuLyTien.dinhDangTien(this.price * this.quantityInCart);
    }
}

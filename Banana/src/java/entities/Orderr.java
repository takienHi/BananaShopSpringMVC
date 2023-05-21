/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.sql.Date;

/**
 *
 * @author PC
 */
public class Orderr {

    private int orderId;
    private int customerId;
    private String fullName;
    private String phoneNumber;
    private String shippingAddress;
    private double totalPrice;
    private String dateCreated;
    private String note;
    private int status;

    public Orderr() {
    }

    public Orderr(int orderId, int customerId, String fullName, String phoneNumber, String shippingAddress, double totalPrice, String dateCreated, String note, int status) {
        this.orderId = orderId;
        this.customerId = customerId;
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.shippingAddress = shippingAddress;
        this.totalPrice = totalPrice;
        this.dateCreated = dateCreated;
        this.note = note;
        this.status = status;
    }

    public Orderr(int customerId, String fullName, String phoneNumber, String shippingAddress, double totalPrice, String dateCreated, String note, int status) {
        this.customerId = customerId;
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.shippingAddress = shippingAddress;
        this.totalPrice = totalPrice;
        this.dateCreated = dateCreated;
        this.note = note;
        this.status = status;
    }

    public Orderr(int customerId, String fullName, String phoneNumber, String shippingAddress, double totalPrice, String note, int status) {
        this.customerId = customerId;
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.shippingAddress = shippingAddress;
        this.totalPrice = totalPrice;
        this.note = note;
        this.status = status;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(String dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}

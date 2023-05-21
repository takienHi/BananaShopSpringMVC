/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import context.ConnectDB;
import entities.Orderr;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class OrderModel {

    public List<Orderr> getAllOrderr() {
        SimpleDateFormat sfomat = new SimpleDateFormat("dd-MM-yyyy");
        String sql = "SELECT * FROM Orderr ORDER BY orderId DESC ";
        List<Orderr> list = new ArrayList<>();
        try {
            Connection conn = ConnectDB.openConnect();

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int orderId = rs.getInt("orderId");
                int customerId = rs.getInt("customerId");
                String phoneNumber = rs.getString("phoneNumber");
                String shippingAddress = rs.getString("shippingAddress");
                double totalPrice = rs.getDouble("totalPrice");
                String dateCreated = sfomat.format(rs.getDate("dateCreated"));
                String note = rs.getString("note");
                int status = rs.getInt("status");

                Orderr order = new Orderr(orderId, customerId, note, phoneNumber, shippingAddress, totalPrice, dateCreated, note, status);

                list.add(order);
            }

            rs.close();
            st.close();
            ConnectDB.closeConnect(conn);

        } catch (SQLException ex) {
            Logger.getLogger(OrderModel.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Orderr getOrderrById(int id) {
         SimpleDateFormat sfomat = new SimpleDateFormat("dd-MM-yyyy");
        String sql = "SELECT * FROM Orderr WHERE orderId = ?";
        Orderr order = null;
        Connection conn = ConnectDB.openConnect();
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                int orderId = rs.getInt("orderId");
                int customerId = rs.getInt("customerId");
                String phoneNumber = rs.getString("phoneNumber");
                String fullName = rs.getString("fullName");
                String shippingAddress = rs.getString("shippingAddress");
                double totalPrice = rs.getDouble("totalPrice");
                String dateCreated = sfomat.format(rs.getDate("dateCreated"));
                String note = rs.getString("note");
                int status = rs.getInt("status");

                order = new Orderr(orderId, customerId, fullName, phoneNumber, shippingAddress, totalPrice, dateCreated, note, status);
            }

            rs.close();
            pst.close();
            ConnectDB.closeConnect(conn);

        } catch (SQLException ex) {
            Logger.getLogger(OrderModel.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return order;
    }
    
    public List<Orderr> getOrderrByCustomerId(int id) {
         SimpleDateFormat sfomat = new SimpleDateFormat("dd-MM-yyyy");
        String sql = "SELECT * FROM Orderr WHERE customerId = ? ORDER BY orderId DESC ";
        List<Orderr> list = new ArrayList<>();
        Connection conn = ConnectDB.openConnect();
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                int orderId = rs.getInt("orderId");
                int customerId = rs.getInt("customerId");
                String phoneNumber = rs.getString("phoneNumber");
                String fullName = rs.getString("fullName");
                String shippingAddress = rs.getString("shippingAddress");
                double totalPrice = rs.getDouble("totalPrice");
                String dateCreated = sfomat.format(rs.getDate("dateCreated"));
                String note = rs.getString("note");
                int status = rs.getInt("status");

                Orderr order = new Orderr(orderId, customerId, fullName, phoneNumber, shippingAddress, totalPrice, dateCreated, note, status);
                list.add(order);
            }

            rs.close();
            pst.close();
            ConnectDB.closeConnect(conn);

        } catch (SQLException ex) {
            Logger.getLogger(OrderModel.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public boolean insertOrderr(Orderr order) {
        long millis=System.currentTimeMillis();   
        Date date=new java.sql.Date(millis);
        boolean result = false;
        String sql = "INSERT INTO Orderr (customerId ,fullName ,phoneNumber ,shippingAddress ,totalPrice ,dateCreated ,note ,[status]) "
                + "VALUES (?,?,?,?,?,?,?,?)";
        Connection conn = ConnectDB.openConnect();
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, order.getCustomerId());
            pst.setString(2, order.getFullName());
            pst.setString(3, order.getPhoneNumber());
            pst.setString(4, order.getShippingAddress());
            pst.setDouble(5, order.getTotalPrice());
            pst.setDate(6,date);
            pst.setString(7, order.getNote());
            pst.setInt(8, order.getStatus());

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);

        } catch (SQLException ex) {
            Logger.getLogger(OrderModel.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public boolean updateOrderr(int id, int status) {
        boolean result = false;
        String sql = "UPDATE Orderr SET [status] = ?";
        sql = sql + " WHERE orderId = " + id;
        Connection conn = ConnectDB.openConnect();
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, status);

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);

        } catch (SQLException ex) {
            Logger.getLogger(OrderModel.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public int getIdorderIdLatest() {
        String sql = "SELECT coalesce(MAX(orderId), 0) AS orderId FROM Orderr";
        int productIdLatest = 0;
        try {
            Connection conn = ConnectDB.openConnect();
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                productIdLatest = rs.getInt(1);
            }
            rs.close();
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(OrderModel.class.getName()).log(Level.SEVERE, null, ex);

        }
        return productIdLatest;
    }
}

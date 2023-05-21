/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import context.ConnectDB;
import entities.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class OrderDetailModel {

    public List<OrderDetail> getAllOrderDetail() {
        String sql = "SELECT o.* ,p.productName as productName,i.linkImage as productImage FROM OrderDetail o "
                + "INNER JOIN Product p ON o.productId = p.productId "
                + "INNER JOIN (SELECT * FROM ProductImage WHERE isMain = 1) i  ON p.productId = i.productId ";
        List<OrderDetail> list = new ArrayList<>();
        try {
            Connection conn = ConnectDB.openConnect();

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int orderDetailId = rs.getInt("orderDetailId");
                int orderId = rs.getInt("orderId");
                int productId = rs.getInt("productId");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                String productName = rs.getString("productName");
                String productImage = rs.getString("productImage");
                OrderDetail orderDetail = new OrderDetail(orderDetailId, orderId, productId, quantity, price, productName, productImage);
                list.add(orderDetail);
            }

            rs.close();
            st.close();
            ConnectDB.closeConnect(conn);

        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<OrderDetail> getOrderDetailById(int id) {
        String sql = "SELECT o.* ,p.productName as productName,i.linkImage as productImage FROM OrderDetail o "
                + "INNER JOIN Product p ON o.productId = p.productId "
                + "INNER JOIN (SELECT * FROM ProductImage WHERE isMain = 1) i  ON p.productId = i.productId "
                + "WHERE orderId = ?";
        List<OrderDetail> list = new ArrayList<>();
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                int orderDetailId = rs.getInt("orderDetailId");
                int orderId = rs.getInt("orderId");
                int productId = rs.getInt("productId");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                String productName = rs.getString("productName");
                String productImage = rs.getString("productImage");
                OrderDetail orderDetail = new OrderDetail(orderDetailId, orderId, productId, quantity, price, productName, productImage);
                list.add(orderDetail);
            }

            rs.close();
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public boolean insertOrderDetail(OrderDetail orderDetail) {
        boolean result = false;
        String sql = "INSERT INTO OrderDetail VALUES (?,?,?,?)";
        Connection conn = ConnectDB.openConnect();
        try {

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, orderDetail.getOrderId());
            pst.setInt(2, orderDetail.getProductId());
            pst.setInt(3, orderDetail.getQuantity());
            pst.setDouble(4, orderDetail.getPrice());

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}

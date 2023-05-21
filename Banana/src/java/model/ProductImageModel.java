/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import context.ConnectDB;
import entities.ProductImage;
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
public class ProductImageModel {

    public List<ProductImage> getAllProductImage() {
        String sql = "SELECT * FROM ProductImage";
        List<ProductImage> list = new ArrayList<>();
        try {
            Connection conn = ConnectDB.openConnect();

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int imgId = rs.getInt("imgId");
                int productId = rs.getInt("productId");
                String linkImage = rs.getString("linkImage");
                boolean isMain = rs.getBoolean("isMain");
                
                ProductImage productImage = new ProductImage(imgId, productId, linkImage,isMain);
                list.add(productImage);
            }

            rs.close();
            st.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(ProductImageModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<ProductImage> getListImageByProductId(int id) {
        String sql = "SELECT * FROM ProductImage WHERE ProductId = ?";
        List<ProductImage> list = new ArrayList<>();
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                int imgId = rs.getInt("imgId");
                int productId = rs.getInt("productId");
                String linkImage = rs.getString("linkImage");
                boolean isMain = rs.getBoolean("isMain");
                
                ProductImage productImage = new ProductImage(imgId, productId, linkImage,isMain);
                list.add(productImage);
            }

            rs.close();
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(ProductImageModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ProductImage getProductImageById(int id) {
        String sql = "SELECT * FROM ProductImage WHERE imgId = ?";
        ProductImage productImage = null;
        Connection conn = ConnectDB.openConnect();
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                int imgId = rs.getInt("imgId");
                int productId = rs.getInt("productId");
                String linkImage = rs.getString("linkImage");
                boolean isMain = rs.getBoolean("isMain");
                
                productImage = new ProductImage(imgId, productId, linkImage,isMain);
            }

            rs.close();
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(ProductImageModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productImage;
    }

    public int getIdProductImageIdLatest() {
        String sql = "SELECT coalesce(MAX(imgId), 0) AS imgId FROM ProductImage";
        int productImageIdLatest = 0;
        try {
            Connection conn = ConnectDB.openConnect();
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                productImageIdLatest = rs.getInt(1);
            }
            rs.close();
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(ProductImageModel.class.getName()).log(Level.SEVERE, null, ex);

        }
        return productImageIdLatest;
    }

    public boolean insertProductImage(ProductImage productImage) {
        boolean result = false;
        String sql = "insert into ProductImage ( productId, linkImage,isMain) values (?,?,?)";
        Connection conn = ConnectDB.openConnect();
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, productImage.getProductId());
            pst.setString(2, productImage.getLinkImage());
            pst.setBoolean(3, productImage.isIsMain());
            
            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(ProductImageModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public boolean updateProductImage(ProductImage productImage) {
        boolean result = false;
        String sql = "UPDATE ProductImage SET linkImage = ?";
        sql = sql + " WHERE imgId = " + productImage.getImgId();
        Connection conn = ConnectDB.openConnect();
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, productImage.getLinkImage());

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(ProductImageModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public boolean updateProductImage2(ProductImage productImage) {
        boolean result = false;
        String sql = "UPDATE ProductImage SET productId = ? ,linkImage = ? ,isMain = ?";
        sql = sql + " WHERE imgId = " + productImage.getImgId();
        Connection conn = ConnectDB.openConnect();
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, productImage.getProductId());
            pst.setString(2, productImage.getLinkImage());
            pst.setBoolean(3, productImage.isIsMain());
            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(ProductImageModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public boolean deleteProductImage(int productImageid) {
        boolean result = false;
        String sql = "DELETE FROM ProductImage where imgId = ?";
        Connection conn = ConnectDB.openConnect();
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, productImageid);

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(ProductImageModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public boolean deleteAllImageByProductId(int productId) {
        boolean result = false;
        String sql = "DELETE FROM ProductImage WHERE productId IN ( SELECT productId FROM ProductImage WHERE productId = ?)";
        Connection conn = ConnectDB.openConnect();
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, productId);

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(ProductImageModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}

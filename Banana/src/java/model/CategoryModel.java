/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import context.ConnectDB;
import entities.Category;
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
public class CategoryModel {

    public List<Category> getAllCategory() {
        String sql = "SELECT * FROM Category";
        List<Category> list = new ArrayList<>();
        try {
            Connection conn = ConnectDB.openConnect();

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int categoryId = rs.getInt("categoryId");
                String categoryName = rs.getString("categoryName");
                boolean status = rs.getBoolean("status");

                Category category = new Category(categoryId, categoryName, status);
                list.add(category);
            }

            rs.close();
            st.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(CategoryModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Category getCategoryById(int id) {
        String sql = "SELECT * FROM Category WHERE categoryId = ?";
        Category category = null;
        Connection conn = ConnectDB.openConnect();
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                int categoryId = rs.getInt("categoryId");
                String categoryName = rs.getString("categoryName");
                boolean status = rs.getBoolean("status");

                category = new Category(categoryId, categoryName, status);
            }

            rs.close();
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(CategoryModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return category;
    }

    public int getIdCategoryIdLatest() {
        String sql = "SELECT coalesce(MAX(categoryId), 0) AS categoryId FROM Category";
        int categoryIdLatest = 0;
        try {
            Connection conn = ConnectDB.openConnect();
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                categoryIdLatest = rs.getInt(1);
            }
            rs.close();
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(CategoryModel.class.getName()).log(Level.SEVERE, null, ex);

        }
        return categoryIdLatest;
    }

    public boolean insertCategory(Category category) {
        boolean result = false;
        String sql = "insert into Category (categoryName, [status]) values (?,?)";
        Connection conn = ConnectDB.openConnect();
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, category.getCategoryName());
            pst.setBoolean(2, category.isStatus());

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(CategoryModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public boolean updateCategory(Category category) {
        boolean result = false;
        String sql = "UPDATE Category SET categoryName = ?, [status] = ?";
        sql = sql + " WHERE categoryId = " + category.getCategoryId();
        Connection conn = ConnectDB.openConnect();
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, category.getCategoryName());
            pst.setBoolean(2, category.isStatus());

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(CategoryModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public int checkCategoryIdInProduct(int categoryId) {
        String sql = "SELECT CAST(COUNT(productId) AS BIT) FROM Product"
                + " WHERE categoryId = "+ categoryId;
        int result = 0;
        try {
            Connection conn = ConnectDB.openConnect();
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                result = rs.getInt(1);
            }
            rs.close();
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(CategoryModel.class.getName()).log(Level.SEVERE, null, ex);

        }
        return result;
    }

    public boolean deleteCategory(int categoryid) {
        boolean result = false;
        String sql = "DELETE FROM Category where categoryId = ?";
        Connection conn = ConnectDB.openConnect();
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, categoryid);

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(CategoryModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}

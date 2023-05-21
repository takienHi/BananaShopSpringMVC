/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import context.ConnectDB;
import entities.Brand;
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
public class BrandModel {

    public List<Brand> getAllBrand() {
        String sql = "SELECT * FROM Brand";
        List<Brand> list = new ArrayList<>();
        try {
            Connection conn = ConnectDB.openConnect();

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int brandId = rs.getInt("brandId");
                String brandName = rs.getString("brandName");
                String brandImage = rs.getString("brandImage");
                boolean status = rs.getBoolean("status");

                Brand brand = new Brand(brandId, brandName, brandImage, status);
                list.add(brand);
            }

            rs.close();
            st.close();
            ConnectDB.closeConnect(conn);

        } catch (SQLException ex) {
            Logger.getLogger(BrandModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Brand getBrandById(int id) {
        String sql = "SELECT * FROM Brand WHERE brandId = ?";
        Brand brand = null;
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                int brandId = rs.getInt("brandId");
                String brandName = rs.getString("brandName");
                String brandImage = rs.getString("brandImage");
                boolean status = rs.getBoolean("status");

                brand = new Brand(brandId, brandName, brandImage, status);
            }

            rs.close();
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(BrandModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return brand;
    }

    public int getIdBrandIdLatest() {
        String sql = "SELECT coalesce(MAX(brandId), 0) AS brandId FROM Brand";
        int brandIdLatest = 0;
        try {
            Connection conn = ConnectDB.openConnect();
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                brandIdLatest = rs.getInt(1);
            }
            rs.close();
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(BrandModel.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        return brandIdLatest;
    }
    
    public boolean insertBrand(Brand brand) {
        boolean result = false;
        String sql = "insert into Brand (brandName, brandImage, [status]) values (?,?,?)";
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, brand.getBrandName());
            pst.setString(2, brand.getBrandImage());
            pst.setBoolean(3, brand.isStatus());

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(BrandModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public boolean updateBrand(Brand brand) {
        boolean result = false;
        String sql = "UPDATE Brand SET brandName = ?, brandImage = ?, [status] = ?";
        sql = sql + " WHERE brandId = " + brand.getBrandId();
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, brand.getBrandName());
            pst.setString(2, brand.getBrandImage());
            pst.setBoolean(3, brand.isStatus());

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(BrandModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public boolean deleteBrand(int brandId) {
        boolean result = false;
        String sql = "DELETE FROM Brand where brandId = ?";
        Connection conn = ConnectDB.openConnect();
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, brandId);

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(BrandModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}

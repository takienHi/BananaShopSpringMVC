/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import context.ConnectDB;
import entities.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class CustomerModel {
    
    public int dangNhap(String userNameLogin, String passwordLogin) {
        String sql = "SELECT CAST(COUNT(customerId) AS BIT) FROM Customer e"
                + " where e.userName =? and e.password = ?";
        int result = 0;
        try {
            Connection conn = ConnectDB.openConnect();
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, userNameLogin);
            pst.setString(2, passwordLogin);
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
    
    public List<Customer> getAllCustomer() {
        String sql = "SELECT * FROM Customer";
        List<Customer> list = new ArrayList<>();
        try {
            Connection conn = ConnectDB.openConnect();

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int customerId = rs.getInt("customerId");
                String fullName = rs.getString("fullName");
                String address = rs.getString("address");
                boolean gender = rs.getBoolean("gender");
                String dateOfBirth = rs.getString("dateOfBirth");
                String phoneNumber = rs.getString("phoneNumber");
                String email = rs.getString("email");
                String userName = rs.getString("userName");
                String password = rs.getString("password");
                boolean status = rs.getBoolean("status");

                Customer customer = new Customer(customerId, fullName, address, gender, dateOfBirth, phoneNumber, email, userName, password, status);
                list.add(customer);
            }

            rs.close();
            st.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Customer getCustomerById(int id) {
        String sql = "SELECT * FROM Customer WHERE customerId = ?";
        Customer customer = null;
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                int customerId = rs.getInt("customerId");
                String fullName = rs.getString("fullName");
                String address = rs.getString("address");
                boolean gender = rs.getBoolean("gender");
                String dateOfBirth = rs.getString("dateOfBirth");
                String phoneNumber = rs.getString("phoneNumber");
                String email = rs.getString("email");
                String userName = rs.getString("userName");
                String password = rs.getString("password");
                boolean status = rs.getBoolean("status");

                customer = new Customer(customerId, fullName, address, gender, dateOfBirth, phoneNumber, email, userName, password, status);

            }

            rs.close();
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customer;
    }

    public Customer getCustomerByUserName(String userNameLogin) {
        SimpleDateFormat sfomat = new SimpleDateFormat("dd-MM-yyyy");
        String sql = "SELECT TOP 1 * FROM Customer WHERE userName = ?";
        Customer customer = null;
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, userNameLogin);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                int customerId = rs.getInt("customerId");
                String fullName = rs.getString("fullName");
                String address = rs.getString("address");
                boolean gender = rs.getBoolean("gender");
                String dateOfBirth = sfomat.format(rs.getDate("dateOfBirth"));
                String phoneNumber = rs.getString("phoneNumber");
                String email = rs.getString("email");
                String userName = rs.getString("userName");
                String password = rs.getString("password");
                boolean status = rs.getBoolean("status");

                customer = new Customer(customerId, fullName, address, gender, dateOfBirth, phoneNumber, email, userName, password, status);

            }

            rs.close();
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customer;
    }
    
    public boolean insertCustomer(Customer customer) {
        SimpleDateFormat sourceFormat = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
                date = sourceFormat.parse(customer.getDateOfBirth());
            } catch (ParseException ex) {
                Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
            }
        String format = formatter.format(date);
        String sql = "INSERT INTO Customer (fullName, address, gender, dateOfBirth, phoneNumber, email, userName, [password], [status]) "
                + " VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        boolean result = false;
        try {
            
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, customer.getFullName());
            pst.setString(2, customer.getAddress());
            pst.setBoolean(3, customer.isGender());
            pst.setString(4, format);
            pst.setString(5, customer.getPhoneNumber());
            pst.setString(6, customer.getEmail());
            pst.setString(7, customer.getUserName());
            pst.setString(8, customer.getPassword());
            pst.setBoolean(9, customer.isStatus());

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public boolean updateCustomer(Customer customer) {
        String sql = "UPDATE Customer SET fullName = ? ,[address] = ? ,gender = ? ,dateOfBirth = ? ,phoneNumber = ? ,email = ? ,userName = ? ,[password] = ? ,[status] = ?";
        sql = sql + " WHERE customerId = " + customer.getCustomerId();
        boolean result = false;
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, customer.getFullName());
            pst.setString(2, customer.getAddress());
            pst.setBoolean(3, customer.isGender());
            pst.setString(4, customer.getDateOfBirth());
            pst.setString(5, customer.getPhoneNumber());
            pst.setString(6, customer.getEmail());
            pst.setString(7, customer.getUserName());
            pst.setString(8, customer.getPassword());
            pst.setBoolean(9, customer.isStatus());

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public boolean updateCusStatus(int customerId,boolean status) {
        String sql = "UPDATE Customer SET [status] = ?";
        sql = sql + " WHERE customerId = " + customerId;
        boolean result = false;
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setBoolean(1, status);

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public boolean deleteBook(Customer customer) {
        String sql = "DELETE FROM Customer where customerId = ?";
        boolean result = false;
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, customer.getCustomerId());

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public int checkCusUnique(String strCheck, String name) {
        String sql = "SELECT CAST(COUNT(customerId) AS BIT) FROM Customer WHERE [" + name + "] = ? ";
        System.out.println(sql);
        int result = 0;
        try {
            Connection conn = ConnectDB.openConnect();
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, strCheck);
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
}

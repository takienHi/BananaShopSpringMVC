/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import context.ConnectDB;
import entities.Employee;
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
public class EmployeeModel {

    public int loginAdmin(String userNameLogin, String passwordLogin) {
        String sql = "SELECT CAST(COUNT(employeeId) AS BIT) FROM Employee e"
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

    public Employee getEmployeeByUserName(String userNameLogin) {
        SimpleDateFormat sfomat = new SimpleDateFormat("dd-MM-yyyy");
        String sql = "SELECT * FROM Employee WHERE userName = ?";
        Employee employee = null;
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, userNameLogin);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                int employeeId = rs.getInt("employeeId");
                int roleId = rs.getInt("roleId");
                String fullName = rs.getString("fullName");
                String address = rs.getString("address");
                boolean gender = rs.getBoolean("gender");
                String dateOfBirth = sfomat.format(rs.getDate("dateOfBirth"));
                String phoneNumber = rs.getString("phoneNumber");
                String email = rs.getString("email");
                String userName = rs.getString("userName");
                String password = rs.getString("password");
                String avatar = rs.getString("avatar");
                boolean status = rs.getBoolean("status");

                employee = new Employee(employeeId, roleId, fullName, address, gender, dateOfBirth, phoneNumber, email, userName, password, avatar, status);

            }

            rs.close();
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return employee;
    }

    public List<Employee> getAllEmployee() {
        SimpleDateFormat sfomat = new SimpleDateFormat("dd-MM-yyyy");
        String sql = "SELECT * FROM Employee";
        List<Employee> list = new ArrayList<>();
        try {
            Connection conn = ConnectDB.openConnect();

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int employeeId = rs.getInt("employeeId");
                int roleId = rs.getInt("roleId");
                String fullName = rs.getString("fullName");
                String address = rs.getString("address");
                boolean gender = rs.getBoolean("gender");
                String dateOfBirth = sfomat.format(rs.getDate("dateOfBirth"));
                String phoneNumber = rs.getString("phoneNumber");
                String email = rs.getString("email");
                String userName = rs.getString("userName");
                String password = rs.getString("password");
                String avatar = rs.getString("avatar");
                boolean status = rs.getBoolean("status");

                Employee employee = new Employee(employeeId, roleId, fullName, address, gender, dateOfBirth, phoneNumber, email, userName, password, avatar, status);
                list.add(employee);
            }

            rs.close();
            st.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Employee> getAllEmployee2() {
        SimpleDateFormat sfomat = new SimpleDateFormat("dd-MM-yyyy");
        String sql = "SELECT e.*,r.roleName as roleName FROM Employee e " 
                + " INNER JOIN Role r ON r.roleId = e.roleId  WHERE e.roleId != 1";
        List<Employee> list = new ArrayList<>();
        try {
            Connection conn = ConnectDB.openConnect();

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int employeeId = rs.getInt("employeeId");
                int roleId = rs.getInt("roleId");
                String fullName = rs.getString("fullName");
                String address = rs.getString("address");
                boolean gender = rs.getBoolean("gender");
                String dateOfBirth = sfomat.format(rs.getDate("dateOfBirth"));
                String phoneNumber = rs.getString("phoneNumber");
                String email = rs.getString("email");
                String userName = rs.getString("userName");
                String password = rs.getString("password");
                String avatar = rs.getString("avatar");
                boolean status = rs.getBoolean("status");
                String roleName = rs.getString("roleName");

                Employee employee = new Employee(employeeId, roleId, fullName, address, gender, dateOfBirth, phoneNumber, email, userName, password, avatar, status, roleName);
                list.add(employee);
            }

            rs.close();
            st.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Employee getEmployeeById(int id) {
        String sql = "SELECT * FROM Employee WHERE employeeId = ?";
        Employee employee = null;
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                int employeeId = rs.getInt("employeeId");
                int roleId = rs.getInt("roleId");
                String fullName = rs.getString("fullName");
                String address = rs.getString("address");
                boolean gender = rs.getBoolean("gender");
                String dateOfBirth = rs.getString("dateOfBirth");
                String phoneNumber = rs.getString("phoneNumber");
                String email = rs.getString("email");
                String userName = rs.getString("userName");
                String password = rs.getString("password");
                String avatar = rs.getString("avatar");
                boolean status = rs.getBoolean("status");

                employee = new Employee(employeeId, roleId, fullName, address, gender, dateOfBirth, phoneNumber, email, userName, password, avatar, status);

            }

            rs.close();
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return employee;
    }

    public int getIdEmployeeIdLatest() {
        String sql = "SELECT coalesce(MAX(employeeId), 0) AS employeeId FROM Employee";
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

    public int checkEmpUnique(String strCheck, String name) {
        String sql = "SELECT CAST(COUNT(employeeId) AS BIT) FROM Employee WHERE [" + name + "] = ? ";
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

    public boolean insertEmployee(Employee employee) {
        SimpleDateFormat sourceFormat = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = sourceFormat.parse(employee.getDateOfBirth());
        } catch (ParseException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        String format = formatter.format(date);
        String sql = "INSERT INTO Employee (roleId, fullName, address, gender, dateOfBirth, phoneNumber, email, userName, [password], [avatar], [status]) "
                + " VALUES ( ?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        boolean result = false;
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, employee.getRoleId());
            pst.setString(2, employee.getFullName());
            pst.setString(3, employee.getAddress());
            pst.setBoolean(4, employee.isGender());
            pst.setString(5, format);
            pst.setString(6, employee.getPhoneNumber());
            pst.setString(7, employee.getEmail());
            pst.setString(8, employee.getUserName());
            pst.setString(9, employee.getPassword());
            pst.setString(10, employee.getAvatar());
            pst.setBoolean(11, employee.isStatus());

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public boolean updateEmployee(Employee employee) {
        String sql = "UPDATE Employee SET roleId = ? , fullName = ? ,[address] = ? ,gender = ? ,dateOfBirth = ? ,phoneNumber = ? ,email = ? ,userName = ? ,[password] = ? ,[avatar] = ? ,[status] = ?";
        sql = sql + " WHERE employeeId = " + employee.getEmployeeId();
        boolean result = false;
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, employee.getRoleId());
            pst.setString(2, employee.getFullName());
            pst.setString(3, employee.getAddress());
            pst.setBoolean(4, employee.isGender());
            pst.setString(5, employee.getDateOfBirth());
            pst.setString(6, employee.getPhoneNumber());
            pst.setString(7, employee.getEmail());
            pst.setString(8, employee.getUserName());
            pst.setString(9, employee.getPassword());
            pst.setString(10, employee.getAvatar());
            pst.setBoolean(11, employee.isStatus());

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public boolean updateEmployee2(Employee employee) {
        SimpleDateFormat sourceFormat = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = sourceFormat.parse(employee.getDateOfBirth());
        } catch (ParseException ex) {
            Logger.getLogger(CustomerModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        String format = formatter.format(date);
        String sql = "UPDATE Employee SET roleId = ? , fullName = ? ,[address] = ? ,gender = ? ,dateOfBirth = ? ,phoneNumber = ? ,email = ? ,[avatar] = ? ,[status] = ?";
        sql = sql + " WHERE employeeId = " + employee.getEmployeeId();
        boolean result = false;
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, employee.getRoleId());
            pst.setString(2, employee.getFullName());
            pst.setString(3, employee.getAddress());
            pst.setBoolean(4, employee.isGender());
            pst.setString(5, format);
            pst.setString(6, employee.getPhoneNumber());
            pst.setString(7, employee.getEmail());
            pst.setString(8, employee.getAvatar());
            pst.setBoolean(9, employee.isStatus());

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public boolean deleteBook(Employee employee) {
        String sql = "DELETE FROM Employee where employeeId = ?";
        boolean result = false;
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, employee.getEmployeeId());

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}

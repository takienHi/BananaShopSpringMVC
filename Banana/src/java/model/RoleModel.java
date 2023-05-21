/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import context.ConnectDB;
import entities.Role;
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
public class RoleModel {

    public List<Role> getAllRole() {
        String sql = "SELECT * FROM Role";
        List<Role> list = new ArrayList<>();
        try {
            Connection conn = ConnectDB.openConnect();

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int roleId = rs.getInt("roleId");
                String roleName = rs.getString("roleName");

                Role role = new Role(roleId, roleName);
                list.add(role);
            }

            rs.close();
            st.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(RoleModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Role getRoleById(int id) {
        String sql = "SELECT * FROM Role WHERE roleId = ?";
        Role role = null;
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                int roleId = rs.getInt("roleId");
                String roleName = rs.getString("roleName");

                role = new Role(roleId, roleName);
            }

            rs.close();
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(RoleModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return role;
    }

    public boolean insertRole(Role role) {
        String sql = "insert into Role (roleName) values (?)";
        Connection conn = ConnectDB.openConnect();
        boolean result = false;
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, role.getRoleName());

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(RoleModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public boolean updateRole(Role role) {
        String sql = "UPDATE Role SET roleName = ?";
        sql = sql + " WHERE roleId = " + role.getRoleId();
        boolean result = false;
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, role.getRoleName());

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(RoleModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public boolean deleteBook(Role role) {
        String sql = "DELETE FROM Role where roleId = ?";
        boolean result = false;
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, role.getRoleId());

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);

        } catch (SQLException ex) {
            Logger.getLogger(RoleModel.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

}

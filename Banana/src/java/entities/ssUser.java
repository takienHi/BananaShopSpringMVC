/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

/**
 *
 * @author PC
 */
public class ssUser {
    
    private String ssUser;
    private int ssRole;
    private String ssFullName;

    public ssUser(String ssUser, int ssRole, String ssFullName) {
        this.ssUser = ssUser;
        this.ssRole = ssRole;
        this.ssFullName = ssFullName;
    }

    public ssUser() {
    }

    public String getSsUser() {
        return ssUser;
    }

    public void setSsUser(String ssUser) {
        this.ssUser = ssUser;
    }

    public int getSsRole() {
        return ssRole;
    }

    public void setSsRole(int ssRole) {
        this.ssRole = ssRole;
    }

    public String getSsFullName() {
        return ssFullName;
    }

    public void setSsFullName(String ssFullName) {
        this.ssFullName = ssFullName;
    }
    
    
}

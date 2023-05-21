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
public class Employee {

    private int employeeId;
    private int roleId;
    private String fullName;
    private String address;
    private boolean gender;
    private String dateOfBirth;
    private String phoneNumber;
    private String email;
    private String userName;
    private String password;
    private String avatar;
    private boolean status;
    
    private String roleName;

    public Employee() {
    }

    public Employee(int employeeId, int roleId, String fullName, String address, boolean gender, String dateOfBirth, String phoneNumber, String email, String userName, String password, String avatar, boolean status) {
        this.employeeId = employeeId;
        this.roleId = roleId;
        this.fullName = fullName;
        this.address = address;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.userName = userName;
        this.password = password;
        this.avatar = avatar;
        this.status = status;
    }

    public Employee(int roleId, String fullName, String address, boolean gender, String dateOfBirth, String phoneNumber, String email, String userName, String password, String avatar, boolean status) {
        this.roleId = roleId;
        this.fullName = fullName;
        this.address = address;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.userName = userName;
        this.password = password;
        this.avatar = avatar;
        this.status = status;
    }

    public Employee(int employeeId, int roleId, String fullName, String address, boolean gender, String dateOfBirth, String phoneNumber, String email, String userName, String password, String avatar, boolean status, String roleName) {
        this.employeeId = employeeId;
        this.roleId = roleId;
        this.fullName = fullName;
        this.address = address;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.userName = userName;
        this.password = password;
        this.avatar = avatar;
        this.status = status;
        this.roleName = roleName;
    }

    public Employee(int employeeId, int roleId, String fullName, String address, boolean gender, String dateOfBirth, String phoneNumber, String email, String avatar, boolean status) {
        this.employeeId = employeeId;
        this.roleId = roleId;
        this.fullName = fullName;
        this.address = address;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.avatar = avatar;
        this.status = status;
    }

    
    

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    @Override
    public String toString() {
        return "Employee{" + "employeeId=" + employeeId + ", roleId=" + roleId + ", fullName=" + fullName + ", address=" + address + ", gender=" + gender + ", dateOfBirth=" + dateOfBirth + ", phoneNumber=" + phoneNumber + ", email=" + email + ", userName=" + userName + ", password=" + password + ", avatar=" + avatar + ", status=" + status + ", roleName=" + roleName + '}';
    }

    
    

    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import context.ConnectDB;
import entities.Product;
import entities.ProductImage;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductModel {

    public List<Product> getAllProduct() {
        SimpleDateFormat sfomat = new SimpleDateFormat("dd-MM-yyyy");
        String sql = "SELECT * FROM Product";
        List<Product> list = new ArrayList<>();
        try {
            Connection conn = ConnectDB.openConnect();

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int productId = rs.getInt("productId");
                int categoryId = rs.getInt("categoryId");
                int brandId = rs.getInt("brandId");
                String productName = rs.getString("productName");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");;
                String addedDate = sfomat.format(rs.getDate("addedDate"));
                String updateDate = sfomat.format(rs.getDate("updateDate"));
                String description = rs.getString("description");
                boolean status = rs.getBoolean("status");
                Product product = new Product(productId, categoryId, brandId, productName, price, quantity, addedDate, updateDate, description, status);
                list.add(product);
            }

            rs.close();
            st.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Product> getListsProduct() {
        SimpleDateFormat sfomat = new SimpleDateFormat("dd-MM-yyyy");
        String sql = "Select  p.*, c.categoryName as categoryName ,b.brandName as brandName ,i.linkImage as [image] from Product p " 
                +"INNER JOIN Category c ON p.categoryId = c.categoryId  " 
                +"INNER JOIN Brand b ON p.brandId = b.brandId " 
                +"INNER JOIN (SELECT * FROM ProductImage WHERE isMain = 1) i  ON p.productId = i.productId ";
        List<Product> list = new ArrayList<>();
        try {
            Connection conn = ConnectDB.openConnect();

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int productId = rs.getInt("productId");
                int categoryId = rs.getInt("categoryId");
                int brandId = rs.getInt("brandId");
                String productName = rs.getString("productName");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");;
                String addedDate = sfomat.format(rs.getDate("addedDate"));
                String updateDate = sfomat.format(rs.getDate("updateDate"));
                String description = rs.getString("description");
                boolean status = rs.getBoolean("status");
                String categoryName = rs.getString("categoryName");
                String brandName = rs.getString("brandName");
                String image = rs.getString("image");
                Product product = new Product(productId, categoryId, brandId, productName, price, quantity, addedDate, updateDate, description, status,categoryName, brandName,image);
                list.add(product);
            }

            rs.close();
            st.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Product> getListsProductByCat(int categoryid2) {
        SimpleDateFormat sfomat = new SimpleDateFormat("dd-MM-yyyy");
        String sql = "Select  p.*, c.categoryName as categoryName ,b.brandName as brandName ,i.linkImage as [image] from Product p " 
                +"INNER JOIN (SELECT * FROM Category WHERE categoryId = "+categoryid2+") c ON p.categoryId = c.categoryId  " 
                +"INNER JOIN Brand b ON p.brandId = b.brandId " 
                +"INNER JOIN (SELECT * FROM ProductImage WHERE isMain = 1) i  ON p.productId = i.productId ";
        List<Product> list = new ArrayList<>();
        try {
            Connection conn = ConnectDB.openConnect();

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int productId = rs.getInt("productId");
                int categoryId = rs.getInt("categoryId");
                int brandId = rs.getInt("brandId");
                String productName = rs.getString("productName");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");;
                String addedDate = sfomat.format(rs.getDate("addedDate"));
                String updateDate = sfomat.format(rs.getDate("updateDate"));
                String description = rs.getString("description");
                boolean status = rs.getBoolean("status");
                String categoryName = rs.getString("categoryName");
                String brandName = rs.getString("brandName");
                String image = rs.getString("image");
                Product product = new Product(productId, categoryId, brandId, productName, price, quantity, addedDate, updateDate, description, status,categoryName, brandName,image);
                list.add(product);
            }

            rs.close();
            st.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<Product> getListsProductByBrand(int brandId2) {
        SimpleDateFormat sfomat = new SimpleDateFormat("dd-MM-yyyy");
        String sql = "Select  p.*, c.categoryName as categoryName ,b.brandName as brandName ,i.linkImage as [image] from Product p " 
                +"INNER JOIN Category c ON p.categoryId = c.categoryId  " 
                +"INNER JOIN (SELECT * FROM Brand WHERE brandId = "+brandId2+") b ON p.brandId = b.brandId " 
                +"INNER JOIN (SELECT * FROM ProductImage WHERE isMain = 1) i  ON p.productId = i.productId ";
        List<Product> list = new ArrayList<>();
        try {
            Connection conn = ConnectDB.openConnect();

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int productId = rs.getInt("productId");
                int categoryId = rs.getInt("categoryId");
                int brandId = rs.getInt("brandId");
                String productName = rs.getString("productName");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");;
                String addedDate = sfomat.format(rs.getDate("addedDate"));
                String updateDate = sfomat.format(rs.getDate("updateDate"));
                String description = rs.getString("description");
                boolean status = rs.getBoolean("status");
                String categoryName = rs.getString("categoryName");
                String brandName = rs.getString("brandName");
                String image = rs.getString("image");
                Product product = new Product(productId, categoryId, brandId, productName, price, quantity, addedDate, updateDate, description, status,categoryName, brandName,image);
                list.add(product);
            }

            rs.close();
            st.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public Product getProductById(int id) {
        SimpleDateFormat sfomat = new SimpleDateFormat("dd-MM-yyyy");
        String sql = "SELECT * FROM Product WHERE productId = ?";

        Product product = null;
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("productId");
                int categoryId = rs.getInt("categoryId");
                int brandId = rs.getInt("brandId");
                String productName = rs.getString("productName");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");;
                String addedDate = sfomat.format(rs.getDate("addedDate"));
                String updateDate = sfomat.format(rs.getDate("updateDate"));
                String description = rs.getString("description");
                boolean status = rs.getBoolean("status");
                product = new Product(productId, categoryId, brandId, productName, price, quantity, addedDate, updateDate, description, status);

            }

            rs.close();
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);

        }
        return product;
    }
    
    public Product getProductById2(int id) {
        SimpleDateFormat sfomat = new SimpleDateFormat("dd-MM-yyyy");
        String sql = "Select p.*, c.categoryName as categoryName ,b.brandName as brandName from Product p "
                + "INNER JOIN Category c ON p.categoryId = c.categoryId "
                + "INNER JOIN Brand b ON p.brandId = b.brandId WHERE productId = ?";

        Product product = null;
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("productId");
                int categoryId = rs.getInt("categoryId");
                int brandId = rs.getInt("brandId");
                String productName = rs.getString("productName");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");;
                String addedDate = sfomat.format(rs.getDate("addedDate"));
                String updateDate = sfomat.format(rs.getDate("updateDate"));
                String description = rs.getString("description");
                boolean status = rs.getBoolean("status");
                String categoryName = rs.getString("categoryName");
                String brandName = rs.getString("brandName");
                product = new Product(productId, categoryId, brandId, productName, price, quantity, addedDate, updateDate, description, status,categoryName, brandName);
            }

            rs.close();
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);

        }
        return product;
    }

    public Product getProductDataForModal(int id) {
        ProductImageModel imageModel = new ProductImageModel();
        List<ProductImage> productImages = imageModel.getListImageByProductId(id);
        SimpleDateFormat sfomat = new SimpleDateFormat("dd-MM-yyyy");
        String sql = "Select p.*, c.categoryName as categoryName ,b.brandName as brandName from Product p "
                + "INNER JOIN Category c ON p.categoryId = c.categoryId "
                + "INNER JOIN Brand b ON p.brandId = b.brandId WHERE productId = ?";

        Product product = null;
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("productId");
                int categoryId = rs.getInt("categoryId");
                int brandId = rs.getInt("brandId");
                String productName = rs.getString("productName");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");;
                String addedDate = sfomat.format(rs.getDate("addedDate"));
                String updateDate = sfomat.format(rs.getDate("updateDate"));
                String description = rs.getString("description");
                boolean status = rs.getBoolean("status");
                String categoryName = rs.getString("categoryName");
                String brandName = rs.getString("brandName");
                product = new Product(productId, categoryId, brandId, productName, price, quantity, addedDate, updateDate, description, status,categoryName, brandName,productImages);
            }

            rs.close();
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);

        }
        return product;
    }
    
    public int getIdProductIdLatest() {
        String sql = "SELECT coalesce(MAX(productId), 0) AS productId FROM Product";
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
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);

        }
        return productIdLatest;
    }

    public int insertProduct(Product product) {
        long millis=System.currentTimeMillis();   
        Date date=new java.sql.Date(millis);

        String sql = "INSERT INTO Product (categoryId, brandId, productName, price, quantity, addedDate, updateDate, [description], [status])"
                + " VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
        boolean check = false;
        int result = 0;
        try {
            Connection conn = ConnectDB.openConnect();
            int productId = getIdProductIdLatest() + 1;
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, product.getCategoryId());
            pst.setInt(2, product.getBrandId());
            pst.setString(3, product.getProductName());
            pst.setDouble(4, product.getPrice());
            pst.setInt(5, product.getQuantity());
            pst.setDate(6, date);
            pst.setDate(7, date);
            pst.setString(8, product.getDescription());
            pst.setBoolean(9, product.isStatus());
            
            check =  pst.executeUpdate()> 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);

        }
        
        if (check) {
            result = getIdProductIdLatest();
        }
        return result;
    }

    public boolean updateProduct(Product product) {
        long millis=System.currentTimeMillis();   
        Date date=new java.sql.Date(millis);
        SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD");
        String strDate = formatter.format(date);

        String sql = "UPDATE Product SET categoryId = ?,brandId = ?,productName = ?,price = ?,quantity = ?,updateDate = ?,[description] = ?,[image] = ?,[status] = ?";
        sql = sql + " WHERE productId = " + product.getProductId();
        boolean result = false;
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, product.getCategoryId());
            pst.setInt(2, product.getBrandId());
            pst.setString(3, product.getProductName());
            pst.setDouble(4, product.getPrice());
            pst.setInt(5, product.getQuantity());
            pst.setString(6, strDate);
            pst.setString(7, product.getDescription());
            pst.setBoolean(8, product.isStatus());

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);

        }
        return result;
    }
    
    public boolean updateProduct2(Product product) {
        long millis=System.currentTimeMillis();   
        Date date=new java.sql.Date(millis);

        String sql = "UPDATE Product SET categoryId = ?,brandId = ?,productName = ?,price = ?,updateDate = ?,[status] = ?";
        sql = sql + " WHERE productId = " + product.getProductId();
        boolean result = false;
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, product.getCategoryId());
            pst.setInt(2, product.getBrandId());
            pst.setString(3, product.getProductName());
            pst.setDouble(4, product.getPrice());
            pst.setDate(5, date);
            pst.setBoolean(6, product.isStatus());

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);

        }
        return result;
    }
    
    public boolean themSoLuongSP(int productId,int soLuong) {
        String sql = "UPDATE Product SET quantity = (quantity + ?) ";
        sql = sql + " WHERE productId = " + productId;
        boolean result = false;
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, soLuong);

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);

        }
        return result;
    }
    
    public boolean truSoLuongSauCheckOut(int productId,int soLuong) {
        String sql = "UPDATE Product SET quantity = (quantity - ?) ";
        sql = sql + " WHERE productId = " + productId;
        boolean result = false;
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, soLuong);

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);

        }
        return result;
    }
    
    public boolean updateDescriptionSP(int productId,String description) {
        String sql = "UPDATE Product SET [description] =  ? ";
        sql = sql + " WHERE productId = " + productId;
        boolean result = false;
        try {
            Connection conn = ConnectDB.openConnect();

            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, description);

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(ProductModel.class.getName()).log(Level.SEVERE, null, ex);

        }
        return result;
    }
    
    public int checkProductExistInOrderDetail(int id) {
        String sql = "SELECT CAST(COUNT(productId) AS BIT) FROM OrderDetail"
                + " WHERE productId = "+ id;
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

    public boolean deletePro(int id) {
        boolean result = false;
        String sql = "DELETE FROM Product where productId = ?";
        Connection conn = ConnectDB.openConnect();
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, id);

            result = pst.executeUpdate() > 0;
            pst.close();
            ConnectDB.closeConnect(conn);
        } catch (SQLException ex) {
            Logger.getLogger(CategoryModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}

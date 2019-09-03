/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejbs;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author Bishnu
 */
public class DbUpdate {
    DbInt dbFunction = new DbInt();
    DbUse DbSelect = new DbUse();
    Connection con = dbFunction.makeConnection();
    PreparedStatement pstm;
    int execute = 0;
    
    public int UpdateCategoryImage(String image) {
        try {
            pstm = con.prepareStatement("UPDATE categories SET image=?"); // function to update the image
            pstm.setString(1, image);
            execute = pstm.executeUpdate();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return execute;
    }
    
    public int updateFoodMenu(String food_name, String description,String price_per_piece, int food_id) { // function to update the food menu
        try {
            pstm = con.prepareStatement("UPDATE fooditems SET food_name=?,description=?,price_per_piece=? WHERE food_id=?");
            pstm.setString(1, food_name);
            pstm.setString(2, description);
              pstm.setString(3, price_per_piece);
            pstm.setInt(4, food_id);
            execute = pstm.executeUpdate();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return execute;
    }
    
    public int UpdateOrdersByOrderId(String deliver_address, String description, String total, String order_id) {// fucntio nto update the delivery order by order id
        try {
            pstm = con.prepareStatement("UPDATE orders SET delivery_address = ?, description = ? ,total = ? WHERE order_id=? ");
            pstm.setString(1, deliver_address);
            pstm.setString(2, description);
            pstm.setString(3, total);
            pstm.setString(4, order_id);
            execute = pstm.executeUpdate();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return execute;
    }
    
     public int UpdateTotalByOrderId(String total, String order_id) {// function to updat the total
        try {
            pstm = con.prepareStatement("UPDATE orders SET total = ? WHERE order_id = ?");
            pstm.setString(1, total);
            pstm.setString(2, order_id);
            execute = pstm.executeUpdate();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return execute;
    }
     
     public int updateUser(String first_name, String last_name, String address, String contact_no, String email, String password, int user_id) {// to update the user details by id
        try {
            pstm = con.prepareStatement("UPDATE users SET first_name=?, last_name=?, address=?, contact_no=?,email=?, password = AES_ENCRYPT(?, 'secret')WHERE user_id=?");
            pstm.setString(1, first_name);
            pstm.setString(2, last_name);
            pstm.setString(3, address);
            pstm.setString(4, contact_no);
            pstm.setString(5, email);
            pstm.setString(6, password);
            pstm.setInt(7, user_id);
            execute = pstm.executeUpdate();

        } catch (Exception ex) {
            ex.getMessage();
        }

        return execute;
    }
     
    public int updateProfile(String first_name, String last_name, String address, String contact_no, String email, String password, int user_id) {// user update the upser details by email
        try {
            pstm = con.prepareStatement("UPDATE users SET first_name=?, last_name=?, address=?, contact_no=?,email=?, password = AES_ENCRYPT(?, 'secret')WHERE user_id=? and email = ?");
            pstm.setString(1, first_name);
            pstm.setString(2, last_name);
            pstm.setString(3, address);
            pstm.setString(4, contact_no);
            pstm.setString(5, email);
            pstm.setString(6, password);
            pstm.setInt(7, user_id);
            execute = pstm.executeUpdate();

        } catch (Exception ex) {
            ex.getMessage();
        }

        return execute;
    }
     
    public Integer UpdateReplyStatus(String ticket_id) {// to update the status by ticket id
        try {
            pstm = con.prepareStatement("UPDATE feedbacks SET reply_status = ? WHERE ticket_id=?");
            pstm.setInt(1, 1);
            pstm.setString(2, ticket_id);
            execute = pstm.executeUpdate();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return execute;
    }
     
     public Integer UpdateQuantity(String quantity, String amount, String od_id) {// to update thwe quantity
        try {
            pstm = con.prepareStatement("UPDATE order_details SET quantity = ?, amount= ? WHERE od_id=?");
            pstm.setString(1, quantity);
            pstm.setString(2, amount);
            pstm.setString(3, od_id);
            execute = pstm.executeUpdate();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return execute;
    }
     
     public Integer OrderStatus(String order_id) {// to update the order status
        try {
            pstm = con.prepareStatement("UPDATE orders SET status = ? WHERE order_id=?");
            pstm.setInt(1, 1);
            pstm.setString(2, order_id);
            execute = pstm.executeUpdate();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return execute;
    }
     
    public Integer UpdateGrandTotal(double service, double vat, String order_id) {// to update the grand total
        try {
            pstm = con.prepareStatement("UPDATE orders SET service=? , vat = ?  WHERE order_id=?");
            pstm.setDouble(1, service);
            pstm.setDouble(2, vat);
            pstm.setString(3, order_id);
            execute = pstm.executeUpdate();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return execute;
    }
}


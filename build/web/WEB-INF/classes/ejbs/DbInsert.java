/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Bishnu
 */
public class DbInsert {
  DbInt dbFunction = new DbInt();
    Connection con = dbFunction.makeConnection();
    PreparedStatement pstm;
    int var = 0;

    public int Category(String cat_name, String image) {
        try {
            pstm = con.prepareStatement("INSERT INTO categories (cat_name, image) VALUES (?,?)");
            pstm.setString(1, cat_name);
            pstm.setString(2, image);
            var = pstm.executeUpdate();

        } catch (Exception ex) {
            ex.getMessage();
        }

        return var;
    }
    
    public int CategoryWithoutImage(String cat_name) {
        try {
            pstm = con.prepareStatement("INSERT INTO categories (cat_name) VALUES (?)", Statement.RETURN_GENERATED_KEYS);
            pstm.setString(1, cat_name);
            var = pstm.executeUpdate();
            System.out.print("inserted");
            try (
                ResultSet rs = pstm.getGeneratedKeys()) {
                if(rs.next()) {
                    System.out.println("abc"+rs.getInt(1));
                }
            }
            pstm.getGeneratedKeys();

        } catch (Exception ex) {
            ex.getMessage();
        }

        return var;
    }
    
    public int FoodMenu(String cat_id, String food_name, String description, String price_per_piece) {
        
        
        
        try {
            pstm = con.prepareStatement("INSERT INTO fooditems (cat_id,food_name, description, price_per_piece) VALUES (?,?,?,?)");
            pstm.setString(1, cat_id);
            pstm.setString(2, food_name);
            pstm.setString(3, description);
            pstm.setString(4, price_per_piece);
            
            var = pstm.executeUpdate();

        } catch (Exception ex) {
            ex.getMessage();
        }

        return var;
    }

    public int User(String first_name, String last_name, String address, String contact_no, String email, String password) {
        try {
            pstm = con.prepareStatement("INSERT INTO users (first_name, last_name, address, contact_no, email, password) VALUES (?,?,?,?,?,AES_ENCRYPT(?, 'secret'))");
            pstm.setString(1, first_name);
            pstm.setString(2, last_name);
            pstm.setString(3, address);
            pstm.setString(4, contact_no);
            pstm.setString(5, email.toLowerCase());
            pstm.setString(6, password);
            var = pstm.executeUpdate();

        } catch (Exception ex) {
            ex.getMessage();
        }

        return var;
    }

    public int OrderDetail(String food_id, String rate, String quantity, String amount, String orderNo) {
        System.out.print("food_id =" +food_id);
        System.out.print("rate=" + rate);
        System.out.print("quantity ="+ quantity );
        System.out.print("amount ="+ amount );
        System.out.print("orderNo= " + orderNo);
        try {
            pstm = con.prepareStatement("INSERT INTO order_details ("
                    + "food_id,rate,quantity,amount,order_id) VALUES (?,?,?,?,?)");
            pstm.setString(1, food_id);
            pstm.setString(2, rate);
            pstm.setString(3, quantity);
            pstm.setString(4, amount);
            pstm.setString(5, orderNo);
            int avar = pstm.executeUpdate();
            pstm.close();
System.out.print("avar ="+ avar);
        } catch (Exception ex) {
            ex.getMessage();
            System.out.print("Hello 123" + ex.getMessage());
        }

        return var;
    }
    
    
    public int UserDetailForOrder(String customer_id) {
        //DbUse dbUserObj=new DbUse();
        //int LastId=0;
        try {
            pstm = con.prepareStatement("INSERT INTO orders(customer_id) VALUES (?) ");
            pstm.setString(1, customer_id);
            var = pstm.executeUpdate();
           // LastId=dbUserObj.LastInsertId();

        } catch (Exception ex) {
            ex.getMessage();
        }

        return var;
    }
    
    public int FeedbackTicket(String customer_id, String subject, String type_id, String description) {
        try {
            pstm = con.prepareStatement("INSERT INTO feedbacks (user_id, subject, type_id, description) VALUES (?,?,?,?)");
            pstm.setString(1, customer_id);
            pstm.setString(2, subject);
            pstm.setString(3, type_id);
            pstm.setString(4, description);
            var = pstm.executeUpdate();

        } catch (Exception ex) {
            ex.getMessage();
        }

        return var;
    }
    
    public int ReplyFeedback(String ticket_id, String description) {
        try {
            pstm = con.prepareStatement("INSERT INTO reply_feedbacks (ticket_id, description) VALUES (?,?)");
            pstm.setString(1, ticket_id);
            pstm.setString(2, description);
            var = pstm.executeUpdate();

        } catch (Exception ex) {
            ex.getMessage();
        }

        return var;
    }
    
    public int Orders(String custId, String ordDate) {
        try {
            System.out.print("custId" + custId);
            pstm = con.prepareStatement("INSERT INTO add_orders (customer_id) VALUES (?)");
            pstm.setString(1, custId);
            var = pstm.executeUpdate();

        } catch (Exception ex) {
            ex.getMessage();
        }

        return var;
    }
    
   
}


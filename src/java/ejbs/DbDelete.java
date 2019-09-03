/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Bishnu
 */
public class DbDelete {
 
    DbInt dbFunction = new DbInt();
    ResultSet result;
    Connection con = dbFunction.makeConnection();// calling the database conenetion 
    PreparedStatement pstm; 
    int execute = 0;
    
    public int DeleteFoodItem(String food_id) {
        try {
            pstm = con.prepareStatement("DELETE FROM fooditems WHERE food_id=?"); // deleteing the food item by id
            pstm.setString(1, food_id);
            execute = pstm.executeUpdate();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return execute;
    }
    
    public int DeleteFoodOrder(String od_id) {
        try {
            pstm = con.prepareStatement("DELETE FROM order_details WHERE od_id=?");// deleting the detail item by id
            pstm.setString(1, od_id);
            execute = pstm.executeUpdate();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return execute;
    }
    
    public int DeleteOrderList(String order_id) {
        try {
            pstm = con.prepareStatement("DELETE FROM orders WHERE order_id=?");// deleting the order item by id
            pstm.setString(1, order_id);
            execute = pstm.executeUpdate();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return execute;
    }
    
    public int DeleteFeedbackList(String ticket_id) {
        try {
            pstm = con.prepareStatement("DELETE FROM feedbacks WHERE ticket_id=?");// deleting the feedback by id 
            pstm.setString(1, ticket_id);
            execute = pstm.executeUpdate();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return execute;
    }
    
    public int DeleteCategory(String cat_id) {
        try {
            pstm = con.prepareStatement("DELETE FROM categories WHERE cat_id=?");// delelting the cateogy by id
            pstm.setString(1, cat_id);
            execute = pstm.executeUpdate();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return execute;
    }
}

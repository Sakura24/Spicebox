/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejbs;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Bishnu
 */
public class DbUse {

    DbInt dbFunction = new DbInt();
    ResultSet result;
    Connection con = dbFunction.makeConnection();
    PreparedStatement pstm;
    int chk = 0;

    public int CountRecords() {
        int count = 0;
        try {
            pstm = con.prepareStatement("SELECT * FROM fooditems");
            result = pstm.executeQuery();
            result.last();
            count = Integer.valueOf(result.getRow());
            out.print(count);
        } catch (Exception e) {
            System.out.println("Error:" + e);

        }
        return count;

    }

    public int FoodItemByCatCount(String cat_id) {
        int count = 0;
        try {
            pstm = con.prepareStatement("SELECT * FROM fooditems WHERE cat_id = ?");
            pstm.setString(1, cat_id);
            result = pstm.executeQuery();
            result.last();
            count = Integer.valueOf(result.getRow());
            out.print(count);
        } catch (Exception e) {
            System.out.println("Error:" + e);

        }
        return count;

    }

    public int CountByOrderId(String order_no) {
        int count = 0;
        try {
            pstm = con.prepareStatement("SELECT * FROM order_details WHERE order_id = ?");
            pstm.setString(1, order_no);
            result = pstm.executeQuery();
            result.last();
            count = Integer.valueOf(result.getRow());
            out.print(count);
        } catch (Exception e) {
            System.out.println("Error:" + e);

        }
        return count;

    }

    public int CountOrderDetail() {
        int count = 0;
        try {
            pstm = con.prepareStatement("SELECT * FROM order_details");
            result = pstm.executeQuery();
            result.last();
            count = Integer.valueOf(result.getRow());
            out.print(count);
        } catch (Exception e) {
            System.out.println("Error:" + e);

        }
        return count;

    }

    public int FeedbackCount() {
        int count = 0;
        try {
            pstm = con.prepareStatement("SELECT * FROM feedbacks WHERE reply_status = 0");
            result = pstm.executeQuery();
            result.last();
            count = Integer.valueOf(result.getRow());
            out.print(count);
        } catch (Exception e) {
            System.out.println("Error:" + e);

        }
        return count;
    }

    public int TodayOrderCount(String current_date) {
        int count = 0;
        try {
            pstm = con.prepareStatement("SELECT * FROM orders WHERE DATE(ordered_date) = ? AND orders.status = 0 AND orders.total>0 AND orders.service>0 AND orders.vat>0");
            pstm.setString(1, current_date);
            result = pstm.executeQuery();
            result.last();
            count = Integer.valueOf(result.getRow());
            out.print(count);
        } catch (Exception e) {
            System.out.println("Error:" + e);

        }
        return count;

    }

    public int CountDisplayAllRepliesById(String ticket_id) {
        int count = 0;
        try {
            pstm = con.prepareStatement("select feedbacks.user_id, feedbacks.subject, feedbacks.type_id,feedbacks.description,feedbacks.post_date, reply_feedbacks.description, reply_feedbacks.reply_date FROM (reply_feedbacks INNER JOIN feedbacks ON reply_feedbacks.ticket_id = feedbacks.ticket_id) WHERE feedbacks.ticket_id = ?");
            pstm.setString(1, ticket_id);
            result = pstm.executeQuery();
            result.last();
            count = Integer.valueOf(result.getRow());
            out.print(count);
        } catch (Exception e) {
            System.out.println("Error:" + e);

        }
        return count;

    }

    public int BetweenDateCount(String month_date, String current_date) {
        int count = 0;
        try {
            pstm = con.prepareStatement("SELECT * FROM orders WHERE DATE(ordered_date)BETWEEN ? AND ? AND total>0 AND service>0 AND vat>0");
            pstm.setString(1, month_date);
            pstm.setString(2, current_date);
            result = pstm.executeQuery();
            result.last();
            count = Integer.valueOf(result.getRow());
            out.print(count);
        } catch (Exception e) {
            System.out.println("Error:" + e);

        }
        return count;
    }

    public int CountOrderDetailByOrderId(String order_no) {
        int count = 0;
        try {
            pstm = con.prepareStatement("SELECT * FROM order_details WHERE order_id = ?");
            pstm.setString(1, order_no);
            result = pstm.executeQuery();
            result.last();
            count = Integer.valueOf(result.getRow());
            out.print(count);
        } catch (Exception e) {
            System.out.println("Error:" + e);

        }
        return count;

    }

    public ResultSet CategoryDisplay() {
        try {
            pstm = con.prepareStatement("SELECT * FROM categories");
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public ResultSet CategoryDisplayById(String cat_id) {
        try {
            pstm = con.prepareStatement("SELECT * FROM categories WHERE cat_id = ?");
            pstm.setString(1, cat_id);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public String CategoryNameById(String cat_id) {
        String foodName = "";
        try {
            pstm = con.prepareStatement("SELECT cat_name FROM categories WHERE cat_id=?");
            pstm.setString(1, cat_id);
            result = pstm.executeQuery();
            if (result.next()) {
                result.first();
                foodName = result.getString(1);
            }
        } catch (Exception e) {
            System.out.println("Error" + e);
        }

        return foodName;
    }

    public ResultSet FoodItemDisplay() {
        try {
            pstm = con.prepareStatement("SELECT * FROM fooditems ORDER BY cat_id");
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public ResultSet FoodItemDisplayByCat(String cat_id) {
        try {
            pstm = con.prepareStatement("SELECT * FROM fooditems WHERE fooditems.cat_id = ?");
            pstm.setString(1, cat_id);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public ResultSet FoodItemDisplayById(String food_id) {
        try {
            pstm = con.prepareStatement("SELECT * FROM fooditems WHERE fooditems.food_id = ?");
            pstm.setString(1, food_id);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public ResultSet UsersDisplay() {
        try {
            pstm = con.prepareStatement("SELECT * FROM users");
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public ResultSet DecryptPassword() {
        try {
            pstm = con.prepareStatement("SELECT AES_DECRYPT(password,'secret') AS password FROM users");
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public ResultSet DecryptPasswordById(int user_id) {
        try {
            pstm = con.prepareStatement("SELECT AES_DECRYPT(password,'secret') AS password FROM users WHERE user_id = ?");
            pstm.setInt(1, user_id);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public ResultSet DecryptPasswordByEmail(String uemail) {
        try {
            pstm = con.prepareStatement("SELECT AES_DECRYPT(password,'secret') AS password FROM users WHERE email = ?");
            pstm.setString(1, uemail);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public String GetUserNameFromEmail(String usrEmail) {
        String userName = "";
        try {
            pstm = con.prepareStatement("SELECT first_name,last_name FROM users WHERE email=? ");
            pstm.setString(1, usrEmail);
            result = pstm.executeQuery();
            if (result.next()) {
                result.first();
                userName = result.getString(1).trim() + " " + result.getString(2).trim();
            }
        } catch (Exception ex) {
            ex.getMessage();
        }
        return userName;
    }

    public ResultSet UserDetailFromEmail(int email) {
        try {
            pstm = con.prepareStatement("SELECT first_name, last_name, address, contact_no, email FROM users WHERE email =?");
            pstm.setInt(1, email);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public ResultSet FoodItemById(int food_id) {
        try {
            pstm = con.prepareStatement("SELECT * FROM fooditems WHERE food_id =?");
            pstm.setInt(1, food_id);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public String FoodNameById(String food_id) {
        String foodName = "";
        try {
            pstm = con.prepareStatement("SELECT food_name FROM fooditems WHERE food_id=?");
            pstm.setString(1, food_id);
            result = pstm.executeQuery();
            if (result.next()) {
                result.first();
                foodName = result.getString(1);
            }
        } catch (Exception e) {
            System.out.println("Error" + e);
        }

        return foodName;
    }

    public String UserNameById(String user_id) {
        String user_name = "";
        try {
            pstm = con.prepareStatement("SELECT first_name, last_name FROM users WHERE user_id=?");
            pstm.setString(1, user_id);
            result = pstm.executeQuery();
            if (result.next()) {
                result.first();
                user_name = result.getString(1).trim() + " " + result.getString(2).trim();
            }
        } catch (Exception e) {
            System.out.println("Error" + e);
        }

        return user_name;
    }

    public String UserEmailById(String user_id) {
        String email = "";
        try {
            pstm = con.prepareStatement("SELECT email FROM users WHERE user_id=?");
            pstm.setString(1, user_id);
            result = pstm.executeQuery();
            if (result.next()) {
                result.first();
                email = result.getString(1).trim();
            }
        } catch (Exception e) {
            System.out.println("Error" + e);
        }

        return email;
    }

    public String TicketTypeById(String type_id) {
        String type = "";
        try {
            pstm = con.prepareStatement("SELECT type FROM feedback_types WHERE type_id=?");
            pstm.setString(1, type_id);
            result = pstm.executeQuery();
            if (result.next()) {
                result.first();
                type = result.getString(1);
            }
        } catch (Exception e) {
            System.out.println("Error" + e);
        }

        return type;
    }

    public ResultSet OrderDetailDisplay() {
        try {
            pstm = con.prepareStatement("SELECT * FROM order_details");
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public ResultSet OrderDetailDisplayByOdId(String od_id) {
        try {
            pstm = con.prepareStatement("SELECT * FROM order_details WHERE od_id = ?");
            pstm.setString(1, od_id);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public ResultSet OrderDetailDisplayByOrderId(String orderNo) {
        try {
            pstm = con.prepareStatement("SELECT * FROM order_details where order_id=?");
            pstm.setString(1, orderNo);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }
    
    public ResultSet OrderDetaiFoodOdId(String od_id) {
        try {
            pstm = con.prepareStatement("SELECT order_details.od_id, fooditems.image, order_details.food_id, order_details.rate, order_details.quantity, order_details.amount FROM order_details INNER JOIN fooditems ON fooditems.food_id = order_details.food_id WHERE od_id = ?");
            pstm.setString(1, od_id);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public ResultSet OrderDetailAndImageOrderId(String orderNo) {
        try {
            pstm = con.prepareStatement("SELECT order_details.od_id, fooditems.image, order_details.food_id, order_details.rate, order_details.quantity, order_details.amount FROM order_details INNER JOIN fooditems ON fooditems.food_id = order_details.food_id WHERE order_id = ?");
            pstm.setString(1, orderNo);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public ResultSet OrderDetailDate() {
        try {
            pstm = con.prepareStatement("SELECT orders.ordered_date FROM ((order_details INNER JOIN orders ON order_details.order_no = orders.order_id) INNER JOIN fooditems ON order_details.food_id = fooditems.food_id)");
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public ResultSet PriceDisplay(int id) {
        try {
            pstm = con.prepareStatement("SELECT price_per_piece FROM fooditems where food_id=?");
            pstm.setInt(1, id);
            result = pstm.executeQuery();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return result;
    }

    public int LastInsertId() {
        int LastId = 0;
        try {
            pstm = con.prepareStatement("SELECT  last_insert_id() AS id");
            result = pstm.executeQuery();
            result.next();
            LastId = result.getInt("id");
        } catch (Exception ex) {
            ex.getMessage();
        }
        return LastId;
    }

    public int LastInsertIdOrder() {
        int LastId = 0;
        try {
            pstm = con.prepareStatement("SELECT order_id FROM orders ORDER BY order_id");
            result = pstm.executeQuery();
            result.last();
            LastId = result.getInt(1);
        } catch (Exception ex) {
            ex.getMessage();
        }
        return LastId;
    }

    public ResultSet GetUserDetailsFromEmail(String userEmail) {
        try {
            pstm = con.prepareStatement("SELECT user_id, first_name, last_name, address, contact_no, email FROM users WHERE email=?");
            pstm.setString(1, userEmail);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public ResultSet UsersDisplayByOrderId(String orderNo) {
        try {
            pstm = con.prepareStatement("SELECT users.first_name, users.last_name, users.address, users.contact_no, users.email,orders.ordered_date FROM (orders INNER JOIN users ON orders.customer_id= users.user_id) WHERE orders.order_id=?");
            pstm.setString(1, orderNo);
            result = pstm.executeQuery();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return result;
    }

    public ResultSet DeliveryDisplayByOrderId(String orderNo) {
        try {
            pstm = con.prepareStatement("SELECT users.first_name, users.last_name, users.address, users.contact_no, users.email, orders.delivery_address, orders.description, orders.ordered_date FROM (orders INNER JOIN users ON orders.customer_id= users.user_id) WHERE orders.order_id=?");
            pstm.setString(1, orderNo);
            result = pstm.executeQuery();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return result;
    }

    public ResultSet FoodDisplayByOrderId(String orderNo) {
        try {
            pstm = con.prepareStatement("SELECT fooditems.food_name, order_details.rate, order_details.quantity,order_details.amount FROM ((order_details INNER JOIN fooditems ON order_details.food_id=fooditems.food_id) INNER JOIN orders ON order_details.order_no=orders.order_id) WHERE orders.order_id=?");
            pstm.setString(1, orderNo);
            result = pstm.executeQuery();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return result;
    }

    public ResultSet FeedbackType() {
        try {
            pstm = con.prepareStatement("SELECT * FROM feedback_types");
            result = pstm.executeQuery();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return result;
    }

    public Integer GetUserIdFromEmail(String usrEmail) {
        Integer user_id = 0;
        try {
            pstm = con.prepareStatement("SELECT user_id FROM users WHERE email=? ");
            pstm.setString(1, usrEmail);
            result = pstm.executeQuery();
            if (result.next()) {
                result.first();
                user_id = result.getInt(1);
            }
        } catch (Exception ex) {
            ex.getMessage();
        }
        return user_id;
    }

    public ResultSet GetCustomerIdFromEmail(String userEmail) {
        try {
            pstm = con.prepareStatement("SELECT user_id FROM users WHERE email=?");
            pstm.setString(1, userEmail);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public ResultSet TotalAmountBySearchDates(String month_date, String current_date) {
        try {
            pstm = con.prepareStatement("SELECT SUM(total) FROM orders WHERE DATE(ordered_date)BETWEEN ? AND ? )");
            pstm.setString(1, month_date);
            pstm.setString(2, current_date);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;

    }

    public ResultSet TotalByDate(String current_date) {
        try {
            pstm = con.prepareStatement("SELECT SUM(total) FROM orders WHERE DATE(ordered_date))=? ");
            pstm.setString(1, current_date);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;

    }
    
    public ResultSet TotalByTwoDate(String month_date, String current_date) {
        try {
            pstm = con.prepareStatement("SELECT SUM(total) FROM orders WHERE DATE(ordered_date)) BETWEEN ? AND ? ");
            pstm.setString(1, month_date);
            pstm.setString(2, current_date);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;

    }
    
    public ResultSet ServiceTotalByDate(String current_date) {
        try {
            pstm = con.prepareStatement("SELECT SUM(service) FROM orders WHERE DATE(ordered_date))=? ");
            pstm.setString(1, current_date);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;

    }
    
    public ResultSet ServiceTotalByTwoDate(String month_date, String current_date) {
        try {
            pstm = con.prepareStatement("SELECT SUM(service) FROM orders WHERE DATE(ordered_date)) BETWEEN ? AND ? ");
            pstm.setString(1, month_date);
            pstm.setString(2, current_date);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;

    }
    
    public ResultSet VatTotalByDate(String current_date) {
        try {
            pstm = con.prepareStatement("SELECT SUM(vat) FROM orders WHERE DATE(ordered_date))=? ");
            pstm.setString(1, current_date);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;

    }
    
    public ResultSet VatTotalByTwoDate(String month_date, String current_date) {
        try {
            pstm = con.prepareStatement("SELECT SUM(vat) FROM orders WHERE DATE(ordered_date)) BETWEEN ? AND ? ");
            pstm.setString(1, month_date);
            pstm.setString(2, current_date);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;

    }

    public ResultSet FeedbackDisplay(String uEmail) {
        try {
            pstm = con.prepareStatement("SELECT feedbacks.ticket_id,feedbacks.subject,feedback_types.type, feedbacks.description, feedbacks.post_date FROM ((feedbacks INNER JOIN users ON feedbacks.user_id = users.user_id) INNER JOIN feedback_types ON feedbacks.type_id = feedback_types.type_id)WHERE users.email = ?");
            pstm.setString(1, uEmail);
            result = pstm.executeQuery();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return result;
    }
    
    public ResultSet FeedbackDisplayById(String ticket_id) {
        try {
            pstm = con.prepareStatement("SELECT * FROM feedbacks WHERE ticket_id = ?");
            pstm.setString(1, ticket_id);
            result = pstm.executeQuery();
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return result;
    }

    public String GetTotalFromOrderNo(String order_no) {
        String num = "";
        try {
            pstm = con.prepareStatement("SELECT SUM(amount) FROM order_details where order_id = ?");
            pstm.setString(1, order_no);
            result = pstm.executeQuery();
            if (result.next()) {
                //result.first();
                num = result.getString(1);
            }
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return num;
    }

    public ResultSet TotalDisplay(String order_id) {
        try {
            pstm = con.prepareStatement("SELECT total FROM orders WHERE order_id = ? ");
            pstm.setString(1, order_id);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;

    }

    public ResultSet UserDetailById(int user_id) {
        try {
            pstm = con.prepareStatement("SELECT * FROM users WHERE user_id =?");
            pstm.setInt(1, user_id);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public ResultSet UserDetailByEmail(String email) {
        try {
            pstm = con.prepareStatement("SELECT * FROM users WHERE email =?");
            pstm.setString(1, email);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public ResultSet UserOrderDetail() {
        try {
            pstm = con.prepareStatement("SELECT orders.order_id,users.first_name, users.last_name, orders.delivery_address, orders.total, orders.ordered_date FROM (orders INNER JOIN users ON orders.customer_id = users.user_id) ORDER BY orders.ordered_date");
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public ResultSet UserOrderDetailById(String order_id) {
        try {
            pstm = con.prepareStatement("SELECT * From orders WHERE order_id = ?");
            pstm.setString(1, order_id);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public ResultSet OrderDetailByDate(String ordered_date) {
        try {
            pstm = con.prepareStatement("SELECT orders.order_id,users.first_name, users.last_name, orders.delivery_address, orders.total,orders.service, orders.vat, orders.ordered_date FROM (orders INNER JOIN users ON orders.customer_id = users.user_id) WHERE DATE(ordered_date) = ? AND orders.status  = 0 AND orders.total>0 AND orders.service>0 AND orders.vat>0 ORDER BY orders.ordered_date");
            pstm.setString(1, ordered_date);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public ResultSet OrderDetailByTwoDate(String current_date, String month_date) {
        try {
            pstm = con.prepareStatement("SELECT orders.order_id,users.first_name, users.last_name, orders.delivery_address, orders.total, orders.service, orders.vat, orders.ordered_date FROM (orders INNER JOIN users ON orders.customer_id = users.user_id) WHERE DATE(ordered_date)BETWEEN ? AND ? AND total>0 AND service>0 AND vat>0 ORDER BY orders.ordered_date");
            pstm.setString(1, current_date);
            pstm.setString(2, month_date);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public ResultSet AdminFeedbackDetail() {
        try {
            pstm = con.prepareStatement("SELECT feedbacks.ticket_id, feedbacks.subject, feedback_types.type, users.first_name, users.last_name FROM ((feedbacks INNER JOIN users ON feedbacks.user_id = users.user_id) INNER JOIN feedback_types ON feedbacks.type_id = feedback_types.type_id) WHERE feedbacks.reply_status = 0");
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public ResultSet FeedbackDetailById(int ticket_id) {
        try {
            pstm = con.prepareStatement("SELECT * FROM feedbacks WHERE ticket_id =?");
            pstm.setInt(1, ticket_id);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public ResultSet ReplyDetail(int ticket_id) {
        try {
            pstm = con.prepareStatement("select feedbacks. user_id, feedbacks.subject, feedbacks.type_id,feedbacks.description,feedbacks.post_date, reply_feedbacks.description, reply_feedbacks.reply_date FROM (reply_feedbacks INNER JOIN feedbacks ON reply_feedbacks.ticket_id = feedbacks.ticket_id) WHERE feedbacks.ticket_id = ?");
            pstm.setInt(1, ticket_id);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

    public ResultSet GetFeedbackIdFromReplyId(String reply_id) {
        try {
            pstm = con.prepareStatement("SELECT ticket_id FROM reply_feedbacks WHERE reply_id=?");
            pstm.setString(1, reply_id);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }

//    public ResultSet DisplayAllReplies(String date) {
//        try {
//            pstm = con.prepareStatement("select feedbacks. user_id, feedbacks.subject, feedbacks.type_id,feedbacks.description,feedbacks.post_date, reply_feedbacks.description, reply_feedbacks.reply_date FROM (reply_feedbacks INNER JOIN feedbacks ON reply_feedbacks.ticket_id = feedbacks.ticket_id) WHERE DATE(reply_feedbacks.reply_date) = ?");
//            pstm.setString(1, date);
//            result = pstm.executeQuery();
//        } catch (Exception ex) {
//            ex.getMessage();
//        }
//        return result;
//    }
    public ResultSet DisplayAllRepliesById(String ticket_id) {
        try {
            pstm = con.prepareStatement("select feedbacks.user_id, feedbacks.subject, feedbacks.type_id,feedbacks.description,feedbacks.post_date, reply_feedbacks.description, reply_feedbacks.reply_date FROM (reply_feedbacks INNER JOIN feedbacks ON reply_feedbacks.ticket_id = feedbacks.ticket_id) WHERE feedbacks.ticket_id = ?");
            pstm.setString(1, ticket_id);
            result = pstm.executeQuery();
        } catch (Exception ex) {
            ex.getMessage();
        }
        return result;
    }
}

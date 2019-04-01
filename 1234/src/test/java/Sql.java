   import java.sql.Connection;
   import java.sql.ResultSet;
   import java.sql.SQLException;
import java.util.*;

   class Sql {

   private Connection conn;
   private ResultSet results;

   public Sql(Connection conn) {
       this.conn = conn;
   }

   public void update(String query) {
       try {
           this.conn.prepareStatement(query).executeUpdate();
           System.out.println("Succefully updated data");
       } catch (SQLException e) {
           System.out.println(e.getMessage());
       }
   }
   
   public void insert(String query) {
       try {
           this.conn.prepareStatement(query).executeUpdate();
           System.out.println("Succefully Inserted data");
       } catch (SQLException e) {
           System.out.println(e.getMessage());
       }
   }

   public  ArrayList<ArrayList<String>> select(String query) {
       try {
           this.results = this.conn.prepareStatement(query).executeQuery();
           ArrayList<ArrayList<String>> res = new ArrayList<ArrayList<String>>();
           
           while (results.next())
           {
        	 ArrayList<String> temp = new ArrayList<String>();  
             int id = results.getInt("id");
             String firstName = results.getString("name");
             String address = results.getString("address");
             int age = results.getInt("age");
             int salary = results.getInt("salary");
             
             temp.add(results.getInt("id")+"");
             temp.add(results.getString("name")+"");
             temp.add(results.getString("address")+"");
             temp.add(results.getInt("age")+"");
             temp.add(results.getInt("salary")+"");
             res.add(temp);
             
             
             // print the results
             System.out.format("%d, %s, %s, %s, %s", id, firstName, address, age, salary);
             System.out.println();
           }
           return res;
           //getResults();
       } catch (SQLException e) {
           System.out.println(e.getMessage());
           return null;
       }
   }
   }
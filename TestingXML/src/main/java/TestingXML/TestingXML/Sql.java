package TestingXML.TestingXML;
   import java.sql.Connection;
   import java.sql.ResultSet;
   import java.sql.SQLException;


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

   public void select(String query) {
       try {
           this.results = this.conn.prepareStatement(query).executeQuery();
           while (results.next())
           {
             int id = results.getInt("id");
             String firstName = results.getString("name");
             String address = results.getString("address");
             int age = results.getInt("age");
             int salary = results.getInt("salary");
             
             // print the results
             System.out.format("%d, %s, %s, %s, %s", id, firstName, address, age, salary);
             System.out.println();
           }
           //getResults();
       } catch (SQLException e) {
           System.out.println(e.getMessage());
       }
   }
   }
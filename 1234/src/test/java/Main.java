import java.sql.Connection;
import java.util.ArrayList;

public class Main {

public static void main(String args[]){
    Connect c = new Connect();
    c.setConnection("demo", "postgres", "admin");
    Connection conn = c.getConnection();
    Sql sql = new Sql(conn);
    String query = "select * from company;";
    //String query1 = "insert into company values(4,'xyz',25,'Bangalore',550400.0)";
    //sql.update(query);
    //sql.insert(query1);
    ArrayList<ArrayList<String>> output = sql.select(query);
    if(output.size()> 0) {
    System.out.println(output);
    
    for(int i = 0;i < output.size();i++) {
    	if(Integer.parseInt(output.get(i).get(3)) > 30) {
    		
    		String query2 = "select * from company where age > 30;";
    		ArrayList<ArrayList<String>> output2 = sql.select(query2);
    		System.out.println("In output 2:\n"+ output2);
    		
    	}
    }
    }
    c.closeConnection();
  }
}
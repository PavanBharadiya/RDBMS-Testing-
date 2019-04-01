package TestingXML.TestingXML;
import java.sql.Connection;
import java.util.*;
import jaxb.*;

public class App 
{
    public static void main( String[] args )
    {
    	
    	Connect c = new Connect();
        c.setConnection("demo", "postgres", "admin");
        Connection conn = c.getConnection();
        Sql sql = new Sql(conn);
    	
        System.out.println( "Hello World!" );
        XMLParsing xparse = new XMLParsing();
	    
	   // xparse.marshallList();
	    ArrayList<ArrayList<String>> result = xparse.unmarshallList();
	    if(result.size() > 0) {
	    System.out.println(result);
	    
	    for(int i = 0;i < result.size();i++) {
	    	if(result.get(i).get(1).equals("Balance") ) {
			//System.out.println(result.get(i).get(1));
	    		String query = "select balance from "+result.get(i).get(0)+";";
	    		System.out.println(query);
	    	}
	    }
	    }
    }
}

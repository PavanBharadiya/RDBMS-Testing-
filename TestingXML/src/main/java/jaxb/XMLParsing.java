package jaxb;

import java.io.File;
import java.util.*;
import javax.xml.bind.*;

public class XMLParsing {

    public void marshallList() {
        try {
            List<Rules> rules = new ArrayList<Rules>();
            rules.add(new Rules(new LHS("Account1", "Balance", ">=", "RT", 1000), new RHS("SQL1")));
            rules.add(new Rules(new LHS("Account2", "Balance", ">=", "RT", 2000), new RHS("SQL2")));
            rules.add(new Rules(new LHS("Account3", "Balance", ">=", "RT", 3000), new RHS("SQL3")));
            RuleList rulelist = new RuleList();
            rulelist.setListRules(rules);

            JAXBContext jc = JAXBContext.newInstance(RuleList.class);
            Marshaller ms = jc.createMarshaller();
            ms.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);

            ms.marshal(rulelist, System.out);
            ms.marshal(rulelist, new File("src\\data\\RulesListNew.xml"));
        } catch (Exception e) {
            System.out.println(e.getStackTrace());
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<ArrayList<String>> unmarshallList() {
        try {
            JAXBContext jc = JAXBContext.newInstance(RuleList.class);
            Unmarshaller ums = jc.createUnmarshaller();
            RuleList rulelist = (RuleList) ums.unmarshal(new File("src\\data\\RulesListNew.xml"));

            System.out.println("Set of Rules");
            ArrayList<ArrayList<String>> all_rules = new ArrayList<ArrayList<String>>();
            for (Rules rules : rulelist.getListRules()) 
            {
            	ArrayList<String> temp = new ArrayList<String>();
                System.out.println("table " + rules.getLhs().getTable());
                System.out.println("type " + rules.getLhs().getElement());
                System.out.println("element " + rules.getLhs().getOperation());
                System.out.println("operation " + rules.getLhs().getType());
                System.out.println("value " + rules.getLhs().getValue());
                System.out.println("action " + rules.getRhs().getAction());
                System.out.println("=============================");
                temp.add(rules.getLhs().getTable()+"");
                temp.add(rules.getLhs().getElement()+"");
                temp.add(rules.getLhs().getOperation()+"");
                temp.add(rules.getLhs().getType()+"");
                temp.add(rules.getLhs().getValue()+"");
                temp.add(rules.getRhs().getAction()+"");
                all_rules.add(temp);
            }
            return all_rules;
        } catch (Exception e) {
            System.out.println(e.getStackTrace());
            System.out.println(e.getMessage());
            return null;
        }
    }

}

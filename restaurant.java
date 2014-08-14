import java.io.*; 
import java.sql.*;

class restaurant { 

  public static void main (String args []) 
      throws SQLException, IOException { 

    boolean done;
    char ch,ch1;
    byte num = 0;

    try {
      Class.forName ("oracle.jdbc.driver.OracleDriver");
    } catch (ClassNotFoundException e) {
        System.out.println ("Could not load the driver");
        return;
      }
    String user, pass;
    user = readEntry("userid  : ");
    pass = readEntry("password: ");

    Connection conn = DriverManager.getConnection
       ("jdbc:oracle:thin:@deuce.cs.ohiou.edu:1521:class", user, pass);

    restaurant r1 = new restaurant();
    done = false;
    do {
      printMenu();
      System.out.print("Type in your option:");
      System.out.flush();
      ch = (char) System.in.read();
      ch1 = (char) System.in.read();
      switch (ch) {
        case '1' : r1.display_restaurant(conn);
                   break;
        case '2' : r1.add_restaurant(conn);
                   break;
        case '3' : r1.delete_restaurant(conn);
                   break;
        case '4' : r1.edit_restaurant(conn);
                   break;
	case '5' : r1.report_one(conn);
		   break;
	case '6' : r1.report_two(conn);
		   break;
        case 'q' : done = true;
                   break;
        default  : System.out.println("Type in option again");
      }
    } while (!done);

    conn.close();
  }


  //readEntry function -- to read input string
  static String readEntry(String prompt) {
     try {
       StringBuffer buffer = new StringBuffer();
       System.out.print(prompt);
       System.out.flush();
       int c = System.in.read();
       while(c != '\n' && c != -1) {
         buffer.append((char)c);
         c = System.in.read();
       }
       return buffer.toString().trim();
     } catch (IOException e) {
       return "";
       }
   }

  void display_restaurant(Connection conn) 
        throws SQLException, IOException {

    Statement stmt = conn.createStatement(); 
    String query = "select * from restaurant";
    ResultSet rset;
    try {
      rset = stmt.executeQuery(query);
    } catch (SQLException e) {
        System.out.println("Error Adding Catalog Entry");
        while (e != null) {
          System.out.println("Message     : " + e.getMessage());
          e = e.getNextException();
        }
        return;
      }   
    while(rset.next()) {
      System.out.println(rset.getInt(1) + " " + rset.getString(2)
		+ " " + rset.getString(3) + " " + rset.getString(4)
                + " " + rset.getInt(5) + " " + rset.getString(6)+ "\n" );
    }
    stmt.close();
  }

  void add_restaurant(Connection conn)
        throws SQLException, IOException {
    String rid = readEntry("Restaurant ID   : ");
    String name = readEntry("Restaurant Name : ");
    String phone = readEntry("Phone #  : ");
    String street_name = readEntry("Street Name : ");
    String street_num = readEntry("Street # : ");
    String sigdish = readEntry("Signature Dish : ");

    String query = "insert into restaurant values ("+ rid + ",'" + name + 
                    "','" + phone + "','" + street_name + "'," + 
                    street_num + ",'" + sigdish + "')";
    Statement stmt = conn.createStatement (); 
    try {
      stmt.executeUpdate(query);
    } catch (SQLException e) {
      System.out.println("Restaurant was not added! Failure!");
      return;
    }
    System.out.println("Restaurant was added! Success!");
    stmt.close();
  }
  

  void delete_restaurant(Connection conn)
        throws SQLException, IOException {
    String rid = readEntry("Restaurant ID to drop : ");
    String query0 = "delete sells where rid = " + rid;
    String query1 = "delete ratings where rid = " + rid;
    String query2 = "delete employee where rid = " + rid;
    String query3 = "delete promotion where rid = " + rid;
    String query4 = "delete restaurant where rid = " + rid;
    
    Statement stmt = conn.createStatement (); 
    try {
      int nrows = stmt.executeUpdate(query0);
      nrows = stmt.executeUpdate(query1);
      nrows = stmt.executeUpdate(query2);
      nrows = stmt.executeUpdate(query3);
      nrows = stmt.executeUpdate(query4);
    } catch (SQLException e) {
        System.out.println("Could not drop student");
        while (e != null) {
          System.out.println("Message     : " + e.getMessage());
          e = e.getNextException();
        }
	return;
      }
    System.out.println("Dropped restaurant");
    stmt.close();
  }
  void edit_restaurant(Connection conn)
        throws SQLException, IOException {
    char ch,ch1;   
    printEditMenu();
    System.out.print("Type in your option:");
    System.out.flush();
    ch = (char) System.in.read();
    ch1 = (char) System.in.read();
    Statement stmt = conn.createStatement (); 
    ResultSet rset;
    System.out.println(ch);

    if(ch == '1') {
      System.out.println("HI!!");
      String rid = readEntry("Restaurant ID : ");
      String query = "select name from restaurant where rid = " + rid;
      try {
        rset = stmt.executeQuery(query);
      } catch (SQLException e) {
          System.out.println("Error");
          while (e != null) {
            System.out.println("Message     : " + e.getMessage());
            e = e.getNextException();
          }
          return;
        }
      System.out.println("");
      if(rset.next()) {
        System.out.println("Old Name = " + rset.getString(1));
        String name = readEntry("New Restaurant Name : ");
        String query2 = "update restaurant set name = '" + name + 
                        "' where rid = " + rid;
        try {
          stmt.executeUpdate(query2);
        } catch (SQLException e) {
            System.out.println("Could not modify name");
            while (e != null) {
              System.out.println("Message     : " + e.getMessage());
              e = e.getNextException();
            }
            return;
          }
        System.out.println("Modified name successfully");  
      }
      else
        System.out.println("Restaurant not found");
      stmt.close();
    }

    if(ch == '2') { 
      String rid = readEntry("Restaurant ID : ");
      String query = "select phone from restaurant where rid = " + rid;
      try {
        rset = stmt.executeQuery(query);
      } catch (SQLException e) {
          System.out.println("Error");
          while (e != null) {
            System.out.println("Message     : " + e.getMessage());
            e = e.getNextException();
          }
          return;
        }
      System.out.println("");
      if(rset.next()) {
        System.out.println("Old Phone # = " + rset.getString(1));
        String phone = readEntry("New Phone # : ");
        String query2 = "update restaurant set phone = '" + phone +
                        "' where rid = " + rid;
        try {
          stmt.executeUpdate(query2);
        } catch (SQLException e) {
            System.out.println("Could not modify phone #");
            while (e != null) {
              System.out.println("Message     : " + e.getMessage());
              e = e.getNextException();
            }
            return;
          }
        System.out.println("Modified phone # successfully");
      }
      else
        System.out.println("Restaurant not found");
      stmt.close();
    }

    if(ch == '3') {
      String rid = readEntry("Restaurant ID : ");
      String query = "select street_name, street_num from restaurant" 
                     + " where rid = " + rid;
      try {
        rset = stmt.executeQuery(query);
      } catch (SQLException e) {
          System.out.println("Error");
          while (e != null) {
            System.out.println("Message     : " + e.getMessage());
            e = e.getNextException();
          }
          return;
        }
      System.out.println("");
      if(rset.next()) {
        System.out.println("Old Street Name = " + rset.getString(1));
        System.out.println("Old Street # = " + rset.getInt(2));
        String name = readEntry("New Street Name : ");
        String num = readEntry("New Street # : ");        
        String query2 = "update restaurant set street_num = " + num +
                        ", street_name = '" + name + "'" +
                        "where rid = " + rid;
        try {
          stmt.executeUpdate(query2);
        } catch (SQLException e) {
            System.out.println("Could not modify address");
            while (e != null) {
              System.out.println("Message     : " + e.getMessage());
              e = e.getNextException();
            }
            return;
          }
        System.out.println("Modified address successfully");
      }
      else
        System.out.println("Restaurant not found");
      stmt.close();
    }

    if(ch == '4') {
      String rid = readEntry("Restaurant ID : ");
      String query = "select sigdish from restaurant where rid = " + rid;
      try {

        rset = stmt.executeQuery(query);
      } catch (SQLException e) {
          System.out.println("Error");
          while (e != null) {
            System.out.println("Message     : " + e.getMessage());
            e = e.getNextException();
          }
          return;
        }
      System.out.println("");
      if(rset.next()) {
        System.out.println("Old Signature Dish = " + rset.getString(1));
        String name = readEntry("New Signature Dish : ");
        String query2 = "update restaurant set sigdish = '" + name +
                        "' where rid = " + rid;
        try {
          stmt.executeUpdate(query2);
        } catch (SQLException e) {
            System.out.println("Could not modify signature dish");
            while (e != null) {
              System.out.println("Message     : " + e.getMessage());
              e = e.getNextException();
            }
            return;
          }
        System.out.println("Modified signature dish successfully");
      }
      else
        System.out.println("Restaurant not found");
      stmt.close();
    }
    return;
  }
  void report_one(Connection conn)
        throws SQLException, IOException {
    String query = "select description, name from promotion p, " +
                   "restaurant r where p.rid = r.rid";
 
    Statement stmt = conn.createStatement (); 
    ResultSet rset = stmt.executeQuery(query);
    while(rset.next())  {
      System.out.println(rset.getString(1) + "\n" + rset.getString(2));
      System.out.println("\n\n\n");
   }
   stmt.close();
   return;
  }
  void report_two(Connection conn)
        throws SQLException, IOException {
    String query = "select sanitation, name from ratings p, " +
                   "restaurant r where p.rid = r.rid";

    Statement stmt = conn.createStatement ();
    ResultSet rset = stmt.executeQuery(query);
    System.out.println("Cleanest Restaurants in Athens");
    while(rset.next())  {
      if(rset.getDouble(1) == 5)
      {
        System.out.println(rset.getDouble(1) + " - " + 
                           rset.getString(2));
        System.out.println("");
      }
    }
    query = "select sanitation, name from ratings p, " +
                   "restaurant r where p.rid = r.rid";

    
    rset = stmt.executeQuery(query);
    System.out.println("\n\nDirtiest Restaurants in Athens");
    while(rset.next())  {
      if(rset.getDouble(1) <= 2)
      {
        System.out.println(rset.getDouble(1) + " - " +
                           rset.getString(2));
        System.out.println("");
      }
    }

    stmt.close();
    return;
  }



  static void printEditMenu() {
    System.out.println("(1) Restaurant Name");
    System.out.println("(2) Phone #");
    System.out.println("(3) Address");
    System.out.println("(4) Signature Dish");
 }


  

  static void printMenu() {
    System.out.println("      RESTAURANTS OF ATHENS\n");
    System.out.println("(1) Display Restaurant Table");
    System.out.println("(2) Add Restaurant");
    System.out.println("(3) Delete Restaurant");
    System.out.println("(4) Edit Restaurant");
    System.out.println("(5) Display First Report");
    System.out.println("(6) Display Second Report");
    System.out.println("(q) Quit\n");
  }
}

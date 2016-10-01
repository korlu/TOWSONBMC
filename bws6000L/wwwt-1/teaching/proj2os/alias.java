//******************************************************************************
// COSC519                    Fall 2002                   Instructor: Dr. Karne
//
// Project: group project
// Author: group 3
// File: alias.java
// Abstract: This class implements the alias table using the hashtable class in
// java. It has six methods.
// 1. report() returns the corresponding standard command if the command is in
//    the hashtable table and returns itself if the command is not in the
//    hashtable table.
// 2. insert() adds the alias and its value to the table.
// 3. cleanCommands() clears all the records in the table.
// 4. remove() removes one key from the table.
// 5. writetofile() outputs all records in the table to the file aliasTable.data. 
// 6. userCommands() outputs user commands in the format of "User Command 
//    Standard Command".
//                                 
//******************************************************************************
import java.io.*;
import java.util.*;


class alias
{

    //create a hashtable of size 100 entries
    Hashtable hash= new Hashtable(100);


    //report the corresponding command
    public String report(String commandLook)
    {

        String test=commandLook;

        //search for test in hashtable
        String standard=(String)hash.get(test);		

        //if test is not present then return the original value back
        if(standard==null)	
        return commandLook;

        //else test is there then returns its corresponding value
        else
        return standard;
    }


    //add the aias and its value to the hashtable
    public void insert(String dummy,String real)
    {	
        String x=dummy;
        String y=real;

        
        hash.put(dummy,real);
    }


    //clear all the records in the hashtable
    public void cleanCommands()
    {
        hash.clear();
    }


    //remove the key from the hashtable
    public void remove(String key)
    {
        hash.remove(key);
    }


    //write all the records in the hashtable to the file aliasTable.data
    public void writetofile()
    {
        //enumerate the hashtable table
        Enumeration std=hash.elements();
        Enumeration user=hash.keys();
        String strUser,strStd;

        try
        {
            //open the aliasTable.data for writing
            FileWriter fr= new FileWriter("aliasTable.data");	
            BufferedWriter out = new BufferedWriter(fr); 
					
            //read and write all hashtable records to file
            while( std.hasMoreElements() )
            {
                strUser=(String)user.nextElement();
                strStd=(String)std.nextElement();						
                out.write(strUser+" "+strStd+"\n");
            }

            //close the file
            out.close();

        }catch(Exception e){}	 
    }			


    //outputs user commands in the format of "User Command   Standard Command"
    public void userCommands()
    {
        //enumerate the hashtable table
        Enumeration n=hash.elements();
        Enumeration o=hash.keys();
        String a,b;
					
        //output the header
        System.out.println("User Command"+"\t"+"Standard command");

        //output all hashtable records
        while( n.hasMoreElements() )
        {
            a=(String)n.nextElement();					
            b=(String)o.nextElement();					
					
            System.out.println(b+"\t\t "+a);
                 			
        }
    }				
						 

}//end of class



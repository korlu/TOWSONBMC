//******************************************************************************
// COSC519                    Fall 2002                   Instructor: Dr. Karne
//
// Project: group project
// Author: group 3
// File: commandLineInterpreter.java
// Abstract: This class implements command line interpreter in java.
// 1. When starting the program, it reads all alias records from aliasTable.data
//    into hashtable and close the file.
// 2. Then it prints prompt mark '$" and goes into an infinite loop waiting for
//    users input commands from keyboard and execute the commands.
// 3. If the command is "alias", then it calls CommandTest class to test if the
//    alias command is correst. If no, it gives re-interpreter on alias command
//    and exit the command line interpreter program. If yes, then it calls alias
//    class insert() methods to add alias values to hashtable table. 
// 4. If the command is "cleanUserCommands", It calls alias class methods
//    cleanCommands() to clear all user commands.
// 5. If the command is "viewUserMapping", then it calls alias class method
//    userCommands() to view all alias command records.
// 6. If the command is "unalias", it calls alias class method remove() to 
//    remove one alias command.
// 7. If the command is "exit", it calls system call exit() to exit this program.
//    And writes all alias records to aliasTable.data file.
// 8. It provides convenience and gives useful information to user on how to
//    use commands correctly.
//                             
//******************************************************************************
import java.lang.*;
import java.io.*;
import java.util.*;

class commandLineInterpreter
{

    public static void main(String args[]) throws IOException{

    alias aliasCommand=new alias();	//instantiating the object of alias class
	
   	
    //open aliasTable.data
    FileReader fis=new FileReader("aliasTable.data");

    //file read streams
    BufferedReader bfile=new BufferedReader(fis);

    String line;

    //read all alias records in aliasTable.data and put them in alias table
    while ( (line=bfile.readLine()) != null )
    {

        StringTokenizer tokens=new StringTokenizer(line, " ");
        String temp3=tokens.nextToken();
        String temp4=tokens.nextToken();
        aliasCommand.insert(temp3, temp4);

    }

    //close file aliasTable.data
    fis.close();
  	
    //infinite loop waiting for commands
    while(true)
    {
        int i=0;                        //loop counter for starting the thread
        int k=0;
        String getCommand=null;

        System.out.print("$");          //prints prompt

        System.out.flush();             //flush the buffer

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        String input = br.readLine();   //read the string from keyboard

        //parsing the string with '&' as delimiter
        StringTokenizer interpret=new StringTokenizer(input,"&");

        //count the number of commands entered
        int count=interpret.countTokens();		

        //creating the threads for number of commands entered
        Thread t[] = new Thread[count];

	 

        //read until no more tokens are left
        while(interpret.hasMoreTokens())
        {
	
            //store each token in the variable
            String firstPart=interpret.nextToken();

			
            //parse the token with space as delimiter
            StringTokenizer temporary1=new StringTokenizer(firstPart);

            //removing if any extra spaces are present
            String check= temporary1.nextToken().trim();


            //compare for alias in the command string
            if(check.equals("alias"))
            {
			
                //if more tokens are there then stores them in another varialbe
                if(temporary1.hasMoreTokens())
                {

                    String temporary2=temporary1.nextToken();
					
                    //parse the string with '=' as delimiter
                    StringTokenizer temporary3=
                                           new StringTokenizer(temporary2,"=");

                    if(temporary3.hasMoreTokens())
                    {
                        String temporary4=temporary3.nextToken();
						
                        CommandTest testComm =new CommandTest(temporary4);
                        Thread test =new Thread(testComm);
                        test.start();

                        String temporary5=temporary3.nextToken();
                        aliasCommand.insert(temporary4,temporary5);
                    }
                }
            }

			
            //compare for cleanUserCommands in the command string
            else if(check.equals("cleanUserCommands"))
            {
                aliasCommand.cleanCommands();
            }
			
            //compare for viewUserMapping in the command string
            else if(check.equals("viewUserMapping"))
            {
                aliasCommand.userCommands();
            }
			
            //compare for unalias in the command string
            else if(check.equals("unalias"))
            {
                String temporary5=temporary1.nextToken();
                aliasCommand.remove(temporary5);
            }


            else
            {
                //compare for exit in the command string
                if(firstPart.equals("exit"))
                {
					
                    aliasCommand.writetofile();
                    System.exit(0);
                }

                //report the command to alias table for checking if alias exist
                getCommand= aliasCommand.report(firstPart);			

                //CommandExecute class implements runnable
                CommandExecute execute= new CommandExecute(getCommand);

                //creating a new thread for each command with object of 
                //CommandExecute class as parameter
                t[i]=new Thread(execute);

                //call the start method to start thread
                t[i].start();
		
                //increment the loop counter to create a seperate thread 
                //for each command
                i++;
	
                k++;
            }


        }//end of inner while


        if(k!=0)
        {		
            //wait for the child threads to finish
            for(int p=0;p<i;p++)
            {

                try{

                       t[p].join();

                   }catch(Exception e){

                                           takeAction();

                                      }
             }  	 		
        }

		
     }//end of outer while

   }//end of main

    public static void takeAction()
    {
       System.out.println("error in joining threads");
       System.out.println("You can use 'ls /bin' to search any command wanted.");
       System.out.println("You can use 'man command' to learn use the command.");
       System.out.print("You can use 'cleanUserCommands' to delete all user");
       System.out.println(" commands");
       System.out.print("You can use viewUserMapping to view all mapping of");
       System.out.println("user commands to standard commands");
       System.out.print("You can use 'alias new command=build-in command' to ");
       System.out.println("apply your familiar command for the same function.");
       System.out.print("You can also use 'unalias User command'");
       System.out.println(" to delete alias command."); 
       System.out.println("You can use 'exit' to exit this program.");
    }	

}//end of class

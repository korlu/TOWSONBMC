//******************************************************************************
// COSC519                    Fall 2002                   Instructor: Dr. Karne
//
// Project: group project
// Author: group 3
// File: CommandExecute.java
// Abstract: This class implements runnable interface in java. There are two 
// methods run(), takeAction().
// 1. run() is to run the command and output the running results.
// 2. takeAction() is to give some useful information if the run thread happens
//    error.
//                                      
//******************************************************************************
import java.io.*;
import java.util.*;
import java.lang.*;

//This CommandExecute class implements runnable interface
class CommandExecute implements Runnable
{

    String runCommand;		//Store the command

    String store=null;		//Variable for storing the output

    //Constructor for CommandExecute class
    CommandExecute(String c)
    {
        runCommand=c;
    }


    //run method
    public void run()
    {
        //getting the reference to runtime object
        Runtime run=Runtime.getRuntime();

        try
        {                                                 

            //if command is "exit", then exits the program
            if(runCommand.equals("exit"))
                System.exit(0);

            //running the command
            Process newProcess= run.exec(runCommand);

            //getting the standard output of the commmand into buffer
            BufferedReader input=new BufferedReader(new InputStreamReader(
                                               newProcess.getInputStream()));

            //getting the error message into buffer
            BufferedReader output=new BufferedReader(new InputStreamReader(
                                               newProcess.getErrorStream()));

            //while buffer for the standard output the command not equal to null
            while(((store=input.readLine())!=null))
            {

                System.out.println(store);
		
            }

            //while buffer for the standard output the command not equal to null
            while(((store=output.readLine())!=null))
            {

                System.out.println(store);

            }
        }catch(Exception e)
                {
				
                    takeAction();
			
                }
		
    }//end of run


    //When run()  happens error, gives some useful information
    public static void takeAction()
    {
       System.out.println("Error executing thread");
       System.out.println("You can use 'ls /bin' to search any command wanted.");
       System.out.println("You can use 'man command' to learn use the command.");
       System.out.print("You can use 'cleanUserCommands' to delete all user");
       System.out.println(" commands");
       System.out.print("You can use viewUserMapping to view all mapping of");
       System.out.println("user commands to standard commands");
       System.out.print("You can use 'make new command=build-in command' to ");
       System.out.println("apply your familiar command for the same function.");
       System.out.print("You can also use 'unalias User command'");
       System.out.println(" to delete make command."); 
       System.out.println("You can use 'exit' to exit this program.");
    }

}//end of class
		

				

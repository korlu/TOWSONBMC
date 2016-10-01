//******************************************************************************
// COSC519                    Fall 2002                   Instructor: Dr. Karne
//
// Project: group project
// Author: group 3
// File: CommandTest.java
// Abstract: This class implements runnable interface. There is one method 
// run(). run is to run the command of the first argument of alias command to
// test if it is a built-in command. If yes, that is the standard output of the
// command is not null, then give re-interpreter of error command and exit the
// command line interpreter program.
//                                       
//******************************************************************************
import java.io.*;
import java.util.*;
import java.lang.*;

//This CommandTest class implements runnable interface to test if the command is
//built-in command
class CommandTest implements Runnable
{

    String runCommand;		//Store the command

    //Constructor for CommandExecute class
    CommandTest(String c)
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

            //running the command
            Process newProcess= run.exec(runCommand);

            //getting the standard output of the commmand into buffer
            BufferedReader input=new BufferedReader(new InputStreamReader(
                                                  newProcess.getInputStream()));

            //if standard output of the commmand is not null, re-interpreter
            //alias command and exit the command line interpreter program
            if(input!=null)
            {
                System.out.println("Error trying to interpret standard command");
                System.out.println(" or already existing aliased command");
                System.out.print("You can only use 'alias ");
                System.out.println("new command=build-in command'.");
                System.out.println("******Exiting the program!******");

                System.exit(0);
            }
			
        }catch(Exception e)
                        {


                        }
		
    }    //end of run

		
}        //end of class
		

				

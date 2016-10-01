//*******************************************************
//        File: RmiServer.java
//        Author: Dr. Ramesh K. Karne
//        Date: May 28, 2000 
//        Towson University Copyright 2000
//        Simple Server Program 
//        Invoke the server with hostname and port number 
//*******************************************************

import java.lang.*;
import java.util.*;
import java.rmi.*;
import java.io.*;

public class RmiServer extends RmiServerStub
	implements RmiInterface 
{
      //object variables 
	private String hostname;
      private String portnumber;
      
      //some local variables   
	String response = new String("");
	int count;
	int i;
	
//***************************************************
RmiServer (String name, String port)throws RemoteException
{
	super(name, port);
	i = 0;
}
//end of constructor
//***************************************************
// receive message from the client method 
// 
public String receiveMessageFromClient(String msg) throws RemoteException
{
        i++; //increment message counter  
        System.out.println("Server Received Msg: "+msg);
	return "Server received client message and processed! "+i;
}//end of method
//***************************************************
//main program 
public static void main(String args[])throws RemoteException
  {
   if (args.length < 2) 
     {
      System.out.println("pass hostname and port number during invocation!"); 
      System.out.println("e.g. java Server triton.towson.edu 2900");
     }

   try {
   RmiServer s = new RmiServer(args[0],args[1]); 
       }
   catch (Exception e) 
     {
      System.out.println("RmiServer: main(): Creation of RmiServer failed..."+e.toString());
      e.printStackTrace(); 
      e.getMessage();
     }
   System.out.println("The server is running at: "+args[0]);
  }//end main 


}  //end of class declaration

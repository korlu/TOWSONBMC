/*
	This is a rmiclient
	File: RmiClient.java
	Author: Dr. Ramesh K. Karne  
	Date: May 18, 2000 
	Towson University Copyright 2000 
*/

import java.awt.*;
import java.rmi.registry.*;
import java.rmi.*;

//**************************************************
public class RmiClient extends RmiClientStub
{
      //global objects 
	Remote serverobject= null;
  	//Remote object interface
  	RmiInterface I1 = null;
	String retCode;
//**************************************************
//constructor for the Client
RmiClient(String hostname, String portnumber) throws RemoteException
  {
  	super(hostname, portnumber);
    	serverobject = this.getServerObject();
    	try  {
            //I1 = (RmiInterface) serverObject; 
       	I1 = this.getServerInterface(serverobject);
           }
    	catch(Exception e)
              {
		System.out.println("RmiClient constructor exception: " +e.toString());
            e.getMessage(); 
            e.printStackTrace(); 
     		System.exit(1);
              }
} //end of the contructor

//**************************************************
public String sendDataToServer(String s)
{
	try {
	   retCode = I1.receiveMessageFromClient( s );
	} catch(Exception e){
		System.out.println("sendDataToServer: Exception: " +e.toString());
            e.getMessage();
            e.printStackTrace(); 
     		System.exit(1);
	}
    return retCode;
} // end of the method
//**************************************************
public RmiInterface getServerInterface(Remote serverobj)
{
    	RmiInterface intf = null;
    	try
      	{
       	 intf = (RmiInterface) serverobj;
      	}
    	catch(Exception exc)
     	{
     		System.out.println("RmiClient: getServerInterface():");
     		System.out.println("  Error with cast - " + exc.toString());
     		exc.printStackTrace();
     	}

  	return intf;
   //return the interface object
  } //end of get server interface

//*******************************************
public static void main(String args[]) throws RemoteException
  {
   int i;
   String retCode = new String(" "); 
   RmiClient rmic = new RmiClient (args[0],args[1]);

   if (args.length < 2) 
     {
      System.out.println("pass two parameters hostname and portnumber with invocation!"); 
      System.out.println("e.g. java RmiClient karne 2090"); 
     }

	try{
          for (i = 0; i < 10; i++) 
           {
          retCode = rmic.sendDataToServer("Client is sending data: "+i);
          System.out.println("Ret Code from Server: "+retCode);
           }
	}
    	catch(Exception e) {
		System.out.println("RmiClient: main():sending msgs: failed"+e.toString());
            e.getMessage();
		e.printStackTrace();
        } // end of catch

  }//end of main

} //end of the class


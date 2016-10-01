//Towson University Copyright 2000
//RKK March 23, 1998 
//RmiClientStub.java filename 
//a generic client class that can 
// be extended to create a client application 
//
import java.awt.*;
import java.applet.*;
import java.util.*;

// the Java RMI classes
import java.rmi.registry.*;
import java.rmi.*;
import java.lang.*; 

public class RmiClientStub
{      

  private Remote serverObject = null; 
  //declare server object 

// ==============================================================
  //constructor for the client object
  public RmiClientStub(String hostname, String portnumber)
            throws RemoteException
  {

	// get the remote object from the Registry
	try
	{
	    serverObject = Naming.lookup 
             ("rmi://" + hostname + ":" + portnumber + "/" +
                    "testServer");
        }
	catch(Exception exc)
	{
	    System.out.println("RmiClientStub: Error with lookup of the  host" + 
              " hostname: " + hostname + " " +
                 " port no: " + portnumber + " " +exc.toString());
          exc.getMessage();  
	    exc.printStackTrace();
        }

  } //end of the construtor 
 
  //method to return the server object 
// ============================================================

  public  Remote getServerObject () 
    {
     return serverObject; 
    }

} //end of class declaration 
 



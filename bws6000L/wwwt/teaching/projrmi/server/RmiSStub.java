//Towson University Copyright 2000 
//This java class can be used to instantiate a rmi server 
//RmiServerStub.java file 
//Author: Dr. Ramesh K. Karne 
// May 28, 2000

import java.rmi.*;
import java.lang.*;
import java.util.*;
import java.rmi.server.*;
import java.rmi.registry.*;

public class RmiServerStub extends UnicastRemoteObject 

{
    //constructor
    RmiServerStub(String hostname, String portno) 
	throws RemoteException
    {
	// call the parent constructor
	super();

	try
	{
	    // reset our Security manager
            LocateRegistry.createRegistry(Integer.parseInt(portno));
           //security problem when running on PCs locally
           // in JDK1.2.2 so do not use security 
	    //System.setSecurityManager(new RMISecurityManager());
	    // plug the server into the Registry

            Naming.bind("rmi://" + hostname + ":" + 
                  portno + "/" + "testServer",this);
	}   //end of try 
	catch(Exception exc)
	{
	    System.out.println("RmiServerStub: Constructor: Error - " + exc.toString());
          exc.getMessage(); 
	    exc.printStackTrace();
	}

    } //end of the constructor


}  //end of class declaration 

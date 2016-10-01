/*
	File: RmiInteface.java
	Author: Dr. Ramesh K. Karne
        May 18, 2000
	Towson University Copyright 2000
*/

import java.rmi.* ;
import java.util.* ;

public interface RmiInterface extends Remote
{
  String receiveMessageFromClient(String msg) throws RemoteException ;
}

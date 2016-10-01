rem make.bat file 
rem   to compile server code
rem Dr. Ramesh K. Karne
rem May 18, 2000

        javac  RmiServerStub.java
        javac  RmiInterface.java
        javac  RmiServer.java

        rmic  RmiServer

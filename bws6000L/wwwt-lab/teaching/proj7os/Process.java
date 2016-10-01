/*
 * Process.java
 *
 * 
 */

/**
 *
 *@autor Eric Avery,Jyotsna Vodela,Vijita Mathur,Tong Li
 *COSC 519 project

 */
import java.util.*;

public class Process extends Thread
{
    public boolean Return;
    private boolean m_Pause;
    public int RunTime;
    public PCB ControlBlock;
    public int TimeMultiplier;
    
    /** Creates a new instance of Process */
    public Process(int ID, int MaxMemUsage) 
    {
        Random NumGen = new Random();
        
        m_Pause = false;
        ControlBlock = new PCB();
        ControlBlock.ID = ID;
        ControlBlock.MemUsage = NumGen.nextInt(409600) + 1; //random mem usage in bytes
        RunTime = NumGen.nextInt(30000); //random time in ms <= 6001
        if(RunTime < 1000){RunTime = 1000;}
        ControlBlock.TotalRunTime = RunTime;
        //ControlBlock.StartTime
    }
    
    public void run() 
    {
        //this is a bussy loop to symulate a process doing some work
        //it runs untill the var RunTime is 0
        //At that point the process is done
        while(RunTime > 0)
        {
            if(m_Pause)
            {
                try
                {
                    synchronized (Thread.currentThread())
                    {
                        Thread.currentThread().wait();
                    }
                } 
                catch (InterruptedException e)
                {
                    // the VM doesn't want us to sleep anymore,
                    // so get back to work
                }
                m_Pause = false;
            }
           
            try 
            {
                Thread.sleep(1);
            } 
            catch (InterruptedException e)
            {
                // the VM doesn't want us to sleep anymore,
               // so get back to work
            }
            RunTime -=1 * TimeMultiplier;
            ControlBlock.CurrentRunTime += 1 * TimeMultiplier;
        }
        Return = true;
    }   
    
    public void Pause()
    {
       m_Pause = true;
    }
}

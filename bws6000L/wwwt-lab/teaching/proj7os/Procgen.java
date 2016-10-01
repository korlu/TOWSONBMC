/*
 * ProcessGenerator.java
 *
 * 
 */

/**
 *
 *@autor Eric Avery,Jyotsna Vodela,Vijita Mathur,Tong Li
 *COSC 519 project

 */
import java.util.*;

public class ProcessGenerator extends Thread
{
    
    private static int LastID;
    public int MaxNewProcesses;
    public int MaxMemUsage;
    public ArrayList NewQueue;
    private ProcessorCallBack m_ProcessCalls;
    
    /** Creates a new instance of ProcessGenerator */
    public ProcessGenerator(int Max, ProcessorCallBack ProcessCalls) 
    {
        LastID = 0;
        MaxNewProcesses = Max;
        NewQueue = new ArrayList();
        m_ProcessCalls = ProcessCalls;
    }
    
    public void run() 
    {
        while(true)
        {
            if(NewQueue.size() < MaxNewProcesses)
            {
                //when we reach 99 then set the id back to 1
                if(LastID == 99)
                {
                    LastID = 1;
                }
                else
                {
                    LastID++;
                }
                
                Process TempProcess = new Process(LastID, MaxMemUsage);
                NewQueue.add(TempProcess);
                m_ProcessCalls.NewProcessCreated(TempProcess.ControlBlock);
                
                try 
                {
                    Thread.sleep(100);
                } 
                catch (InterruptedException e)
                {
                    // the VM doesn't want us to sleep anymore,
                    // so get back to work
                }
            }
            else
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
            }
        }
    }
}

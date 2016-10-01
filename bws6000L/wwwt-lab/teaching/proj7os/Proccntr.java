/*
 * ProcessController.java
 *
 * 
 */

/**
 *@autor Eric Avery,Jyotsna Vodela,Vijita Mathur,Tong Li
 *COSC 519 project

 */

import java.util.*;
import java.lang.Integer;

public class ProcessController extends Thread
{
    //time in ms each process gets to run before being 
    //bumped back to the end of the ready queue
    private long TIMESLICE = 1500;    
    
    private int m_TimeMultiplier = 1;
    private int m_MaxNewProcessCount = 5;
    private MemoryManager m_MemManager;
    public ArrayList m_ReadyQueue,
                     m_NewQueue;
    private ProcessGenerator Generator;
    private ProcessScheduler Scheduler;
    private ProcessorCallBack m_ProcessCalls;
    private Process m_SchedulerProcess;
    private Process m_CurrentProcess;
    private boolean m_StopProcessing;
    private boolean m_Paused;
    
    /** Creates a new instance of ProcessController */
    public ProcessController(ProcessorCallBack ProcessCalls, MemoryManager MemManager) 
    {
        m_ProcessCalls = ProcessCalls;
        m_MemManager = MemManager;
        m_Paused = false;
    }
    
     public void run() 
     {  
        //create a process to use for when the scheduler runs 
        //this process will never hit the ready or new queue
        m_SchedulerProcess = new Process(0, 0);
        
        if(Generator == null)
        {
            Generator = new ProcessGenerator(m_MaxNewProcessCount, m_ProcessCalls);
        }
        
        m_NewQueue = Generator.NewQueue;
        
        if(Scheduler == null)
        {
            Scheduler = new ProcessScheduler(m_ProcessCalls, m_NewQueue, m_MemManager);
        }
     
        m_ReadyQueue = Scheduler.ReadyQueue;
        
        Generator.start(); 
        
        ProcessReadyQueue();
    }
    
    public void Pause() 
    {
        if(!m_Paused)
        {
            try
            {
                synchronized (Generator)
                {
                    Generator.wait();
                }
                 m_Paused = true;
            }
            catch(InterruptedException E)
            {
            }
        }
    }
    
    public void Wakeup()
    {
        if(Generator != null)
        {
            synchronized (Generator)
            {
                Generator.notify();  
            }    
            m_Paused = false;
        }   
    }
    
    public int GetProcessMaxMemUsage()
    {
        if(Generator == null)
        {
            return 0;
        }
        else
        {
            return Generator.MaxMemUsage;
        }
        
    }
    
    public void SetProcessMaxMemUsage(int Value)
    {
        if(Generator == null)
        {
            Generator = new ProcessGenerator(m_MaxNewProcessCount, m_ProcessCalls);
        }
        
        Generator.MaxMemUsage = Value;
    }
    
    public String[] GetReadyProcessIDs()
    {
        boolean ShouldPause = !m_Paused;
        //pause the current processing to get the current list
        if(ShouldPause)
        {
            Pause();
        }
        
        int NumReady = m_ReadyQueue.size();
        String[] IDs = new String[NumReady];
        
        for(int i=0; i < NumReady; i++)
        {
            IDs[i] = Integer.toString(((Process) m_ReadyQueue.get(i)).ControlBlock.ID);
        }
        
        if(ShouldPause)
        {   
            Wakeup();
        }
        
        return IDs;
    }
    
    public String[] GetNewProcessIDs()
    {
        boolean ShouldPause = !m_Paused;
        //pause the current processing to get the current list
        if(ShouldPause)
        {
            Pause();
        }
        
        int NumNew = Generator.NewQueue.size();
        String[] IDs = new String[NumNew];
        
        for(int i=0; i < NumNew; i++)
        {
            IDs[i] = Integer.toString(((Process) Generator.NewQueue.get(i)).ControlBlock.ID);
        }
        
        if(ShouldPause)
        {   
            Wakeup();
        }
        
        return IDs;
    }
    
    public void ChageProcessStartFrame(int PID, int NewStartFrame)
    {
        boolean ShouldPause = !m_Paused;
        int NumReady = Scheduler.ReadyQueue.size();
        int NewEndFrame;
        PCB ProcessPCB;
        
        if(ShouldPause)
        {
            Pause();
        }
        
        for(int i=0; i < NumReady; i++)
        {
            ProcessPCB = ((Process) Scheduler.ReadyQueue.get(i)).ControlBlock;
            if(ProcessPCB.ID == PID)
            {
               NewEndFrame = NewStartFrame + m_MemManager.RequestBlock((int) ProcessPCB.MemUsage);
               ProcessPCB.SetFrames(NewStartFrame, NewEndFrame);
               
               m_ProcessCalls.ProcessFramesMoved(ProcessPCB);
               
               break;
            }
        }
        
        if(ShouldPause)
        {   
            Wakeup();
        }
    }
    
    public void SetTimeMultiplier(int Value)
    {
        boolean ShouldPause = !m_Paused;
        if(ShouldPause)
        {
            Pause();
        }
        
        m_TimeMultiplier = Value;
        
        if(ShouldPause)
        {   
            Wakeup();
        }
    }
    
    public void ClearReadyQueue() 
    {
        boolean ShouldPause = !m_Paused;
        if(ShouldPause)
        {
            Pause();
        }
        
        Scheduler.ReadyQueue.clear();
        
        if(ShouldPause)
        {   
            Wakeup();
        }
    }
    
    public void ClearNewQueue() 
    {
        boolean ShouldPause = !m_Paused;
        if(ShouldPause)
        {
            Pause();
        }
        
        Generator.NewQueue.clear();
        
        if(ShouldPause)
        {   
            Wakeup();
        }
    }
    
    private void ProcessReadyQueue()
    {     
        while(!m_StopProcessing)
        {
            while(m_Paused)
            {
                try
                {
                    sleep(500);
                }
                catch (InterruptedException e)
                {
                    // the VM doesn't want us to sleep anymore,
                    // so get back to work
                }
            }
            
            if(m_ReadyQueue.size() > 0)
            {
                //get a process to run
                m_CurrentProcess = (Process) m_ReadyQueue.remove(0);
                
                m_ProcessCalls.ProcessStarted(m_CurrentProcess.ControlBlock);
                
                m_CurrentProcess.TimeMultiplier = m_TimeMultiplier; 
                
                if(m_CurrentProcess.isAlive())
                {
                    synchronized (m_CurrentProcess)
                    {
                        m_CurrentProcess.notify();
                    }
                }
                else
                {
                    m_CurrentProcess.start();
                }
                
                try
                {
                    if(TIMESLICE < m_CurrentProcess.ControlBlock.TotalRunTime)
                    {
                        //let the current process run for its time slice
                        sleep(TIMESLICE);
                    }
                    else
                    {
                        sleep(m_CurrentProcess.ControlBlock.TotalRunTime);
                    }
                   
                }
                catch (InterruptedException e)
                {
                    // the VM doesn't want us to sleep anymore,
                    // so get back to work
                }
                
                m_CurrentProcess.Pause();
                
                if(m_CurrentProcess.Return)
                {
                    m_ProcessCalls.ProcessCompleted(m_CurrentProcess.ControlBlock);
                    
                    //dealocate the processes Memory
                    m_MemManager.DeAllocate(m_CurrentProcess.ControlBlock);
                    
                    System.out.println("Memory Deallocated");
                    
                    Scheduler.MemDefragmentor.Defraged = false;
                    
                    m_CurrentProcess = null;
                }
                else
                {
                    m_ProcessCalls.NewProcessReady(m_CurrentProcess.ControlBlock);
                    m_ReadyQueue.add(m_CurrentProcess);
                }
            }
            m_ProcessCalls.ProcessStarted(m_SchedulerProcess.ControlBlock);
                 
            //run the process scheduler
            Scheduler.Schedule();
            
            synchronized (Generator)
            {
                Generator.notify();
            }
        }
    }
    
}

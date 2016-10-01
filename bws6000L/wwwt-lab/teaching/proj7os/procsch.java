/*
 * ProcessSceduler.java
 *
 * 
 */

/**
 *
*@autor Eric Avery,Jyotsna Vodela,Vijita Mathur,Tong Li
 *COSC 519 project
 */

import java.util.*;

public class ProcessScheduler {
    
    public ArrayList ReadyQueue;
    
    private boolean m_StopProcessing;
    private ProcessorCallBack m_ProcessCallback;
    private ArrayList m_NewQueue;
    private MemoryManager m_MemManager;
    public Defragmentor MemDefragmentor;
    
    /** Creates a new instance of ProcessSceduler */
    public ProcessScheduler(ProcessorCallBack CallBack, ArrayList NewQueue, MemoryManager MemManager) 
    {
        ReadyQueue = new ArrayList();
        m_ProcessCallback = CallBack;
        m_NewQueue = NewQueue;
        m_MemManager = MemManager;
        MemDefragmentor = new Defragmentor();
    }
    
    public void Schedule()
    {
        int StartFrame;
        int Count = 0;
        
        //loop twice if we need to run the memory defragmentor
        while(Count < m_NewQueue.size())
        {
            if(m_NewQueue.size() > 0) //&& ReadyQueue.size() <= 15)
            {
                //get a process to make ready
                Process CurrentProcess = (Process) m_NewQueue.get(Count);
                
                System.out.println("Trying to get memory for process " + String.valueOf(CurrentProcess.ControlBlock.ID));
                
                if(m_MemManager.mem_Alloc(CurrentProcess.ControlBlock))
                {
                    //we got memory
                    //add the process to the ready queue
                    m_ProcessCallback.NewProcessReady(CurrentProcess.ControlBlock);
                    ReadyQueue.add(m_NewQueue.remove(Count));
                    //break the while loop
                    break;
                }
                else
                {
                    //call the memory defragmentor then try again
                    if(!MemDefragmentor.Defraged)
                    {
						//here we dont update the count so that we can try to 
						//allocate memory to the same process again after defraging
						
                        System.out.println("Running Defragmentor");
                        MemDefragmentor.memDefrag(m_MemManager, ReadyQueue, m_ProcessCallback);
                    }
                    else
                    {
						Count++;
                    }
                }
            }
            else
            {
                //cant load a process into the ready queue
                //break the while loop
                break;
            }
        }
    }
}

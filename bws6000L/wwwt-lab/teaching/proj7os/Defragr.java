/********************************************************************************
 *Defragmentation
 *
 * the following function "memDefrag()" does the job.
 *the rest of the parts are drivers.
 *
 *i assume that ReadyQueue is a global ArrayList. 
 *i have two more global variables: 
 *
 *	1. "ArrayList OrderedProcessArray" - stores all Process in the order 
 *					     they physically appear in the mem 
 *					     space. then the program can follow 
 *					     this sequence to move process around 
 *					     without causing errors by overwriting.
 *					     
 *	2. "boolean Defraged" - indicating if the mem is defraged or not. it 
 *				is set to "true" each time right after 
 *				defragmentaion is down. it will be set to "false"
 *				once a process has been removed and mem space has 
 *				been deallocated.
 *
 *
 *@autor Eric Avery,Jyotsna Vodela,Vijita Mathur,Tong Li
 *COSC 519 project
 *
 *********************************************************************************/

import java.util.*;
import java.io.*;

public class Defragmentor{

        public boolean Defraged;
        
	public void memDefrag(MemoryManager Manager, ArrayList ReadyQueue, ProcessorCallBack pCallBack)
        {
            if(ReadyQueue.size() > 0)
            {
		Process tempProcess1 = new Process(-1, -1); //set up 2 temp slot for Process
		Process tempProcess2 = new Process(-1, -1);
                ArrayList OrderedProcessArray = new ArrayList();
		//PCB tempPCB = new PCB(0);
		//tempPCB.SetStartFrame(1);

		for (int i = 0; i < ReadyQueue.size() - 1; i++){
			
		    for (int j = 0; j < ReadyQueue.size() - 1 - i; j++){
			    
			tempProcess1 = (Process) ReadyQueue.get(j);
			tempProcess2 = (Process) ReadyQueue.get(j + 1);
			
			if (tempProcess1.ControlBlock.StartFrame < tempProcess2.ControlBlock.StartFrame){
				ReadyQueue.set(j + 1, tempProcess1);
				ReadyQueue.set(j, tempProcess2);
			}
		    }			    
		}//Process has been ordered by their start frame and placed in ReadyQueue

		for (int i = 0; i < ReadyQueue.size(); i++){

			OrderedProcessArray.add((Process) ReadyQueue.get(ReadyQueue.size() - i - 1));
		}//reverse ReadyQueue and put it into OrderedProcessArray
		 //this OrderedProcessArray store Process in the order they appear in the physical memmory
		
		long fuf = 0; //first unoccupied frame 
                long EndFrame = 0; //last frame used by process
		
		for (int i = 0; i < OrderedProcessArray.size(); i++){		

			tempProcess1 = (Process) OrderedProcessArray.get(i); //get the ith item in ordered process list
			
                        EndFrame = fuf + tempProcess1.ControlBlock.GetNumFramesUsed() - 1;
                        
                        tempProcess1.ControlBlock.SetFrames((int) fuf, (int) EndFrame); // move it to the end of defraged block
			//fuf = fuf + tempProcess1.ControlBlock.MemUsage; // extend 
                        fuf = EndFrame + 1; // extend 
		}//OrderedProcessArray has been defragged
		
		for (int i = 0; i < OrderedProcessArray.size(); i++){	
			
			tempProcess1 = (Process) OrderedProcessArray.get(i);
				for (int j = 0; j < ReadyQueue.size(); j++){
						
					tempProcess2 = (Process) ReadyQueue.get(j);
					if (tempProcess1.ControlBlock.ID == tempProcess2.ControlBlock.ID)

					tempProcess2.ControlBlock.SetFrames(tempProcess1.ControlBlock.StartFrame, tempProcess1.ControlBlock.EndFrame);
			}
		}//PCBs in ReadyQueue is modified

		MemoryManager.ListNode mlistnode = Manager.memReq.head;
		
		for (int i = 0; i < OrderedProcessArray.size(); i++){
			
			tempProcess1 = (Process) OrderedProcessArray.get(i);
			int tempID = tempProcess1.ControlBlock.ID;
			int num_frame = tempProcess1.ControlBlock.EndFrame - tempProcess1.ControlBlock.StartFrame + 1;
			//System.out.println("Process " + tempID + " has " + num_frame + " Frames.");
			//System.out.println("          Start Frame = " + tempProcess1.ControlBlock.StartFrame + "  End Frame = " + tempProcess1.ControlBlock.EndFrame);
			
			//System.out.print("    Frame ");
			
			for (int j = 0; j < num_frame; j++){
			
				mlistnode.processid = tempProcess1.ControlBlock.ID;
				//System.out.print(j + " ");
				mlistnode = mlistnode.next;
			}
			//System.out.println(" has been moved into new position.");
			
			pCallBack.ProcessFramesMoved(tempProcess1.ControlBlock);

		}//memory Linked List modified
		
                if(mlistnode != null)
                {
                    while (mlistnode.next != null){

                            //System.out.println("mlistnode.next = " + mlistnode.frame_no);
                            mlistnode.processid = -1;
                            mlistnode = mlistnode.next;
                    }

                    if(mlistnode.next != null)
                    {
                        //clear the last frame
                        mlistnode.processid = -1;
                    }
                }
/*
		//debug code, display all frames' content
		MemoryManager.ListNode checklistnode = Manager.memReq.head;
		int checkcount = 0;

		while (checklistnode.next!=null){

			System.out.println ("Memory frame No." + checkcount + " belongs to Process " + checklistnode.processid);
			checklistnode = checklistnode.next;
			checkcount++;
		}//debug code end
*/
		System.out.println("Memory has been defraged.");
		Defraged = true;
            }
            else
            {
                //nothing in memory to defrag
                Defraged = true;
            }
 	}
            
	
}






import java.util.*;
import java.io.*;

/**
* Allocates/Deallocates memory 
*@autor Eric Avery,Jyotsna Vodela,Vijita Mathur,Tong Li
 *COSC 519 project
*/
public class MemoryManager
{
    public static long FRAME_SIZE = 4096;
    public static long MAX_FRAMES = 1000;
    public static long max_size = FRAME_SIZE * MAX_FRAMES;

    public SinglyLinkedList memReq = new SinglyLinkedList();
    public static int no_of_freeframes = 0;
    public static int frames_alloc = 0;
    public double no_of_frames = 0;
    /**
     * 
     * @param size long
     * @return
     */
    public int RequestBlock(long size)
    {
       if(size == 0)
          return 0;

       else if( size <= FRAME_SIZE)
          return 1;

        else
        {
            no_of_frames = (double)size/(double)FRAME_SIZE;
            int frames_req;
            if(no_of_frames % 1 == 0)
            {
              frames_req = (int)no_of_frames ;
              return frames_req;
            }
            else
            {
              frames_req = (int)no_of_frames+1;
              return frames_req;
            }

       }
    }//


  /**
   * First Fit Algorithm.
   * @param noreq
   * @return position in memory where process can be accomodated
   */
public int position(int frames_reqd)
{
    ListNode mlistnode=new ListNode();
    ListNode last=new ListNode();
    int f_count;
    int m_frameno;
    if(frames_reqd + memReq.count < MAX_FRAMES )
    {
      
      if(memReq.head == null) 
         return 0;
         
      mlistnode = memReq.head;
      while(mlistnode!=null)// MemReq list is not empty check for available free spaces
      {
         if(mlistnode.processid==-1)//free space found
         {
            f_count=1;
            m_frameno=mlistnode.frame_no;
   
            while(mlistnode.processid == -1 && mlistnode.next!=null)
            {
                f_count++; // no of free frames
              
                if(f_count == frames_reqd) // does no of free frames satisfy the request?
                 {
                    return m_frameno; // if yes, return start frame of the hole  
                 }
         
                 mlistnode=mlistnode.next;
             }       
   
                
          }
        
          if(mlistnode.next == null)
          {
              //found the end of the linkes list
              if(mlistnode.frame_no+1 + frames_reqd < MAX_FRAMES)
              {
                  return mlistnode.frame_no+1;
              }
              else
              {
                  //out of memory
                  return -1;
              }   
          }
          else
          {
              mlistnode = mlistnode.next;
          }

      }//end while

      /*
      last=memReq.head; //else allocate at end of memReq
        
      while(last.next !=null)
        last=last.next;
      
      if(last.frame_no+1 + frames_reqd > max_size)
      {
          //out of memory
          return -1;
      }
      else
      {
          return(last.frame_no+1);
      }
       **/

   }

   return -1;//memory full!!call defragmentar
}
           
 


/**
  * @param size
  * @param process_id
  * @return start frame
  */
public boolean mem_Alloc(PCB m_Process)//Returns the Start Frame
{

    int f = RequestBlock(m_Process.MemUsage);
    int first_frame=0;
    ListNode temp=new ListNode();
    int frame_allocated=position(f);

    if(frame_allocated==-1)//Out of Memory!!
    {
      //System.out.println("Out of Memory");
      return false; 
    }

    m_Process.StartFrame=frame_allocated;
    for( int i = 0;i <= f;i++)
    {
        ListNode n = new ListNode();
        n.frame_no = frame_allocated;
        n.processid = m_Process.ID;
        n.next= null;
        frame_allocated++;
        if(memReq.head!=null)
        {
             temp=memReq.head;
             while(temp.next!=null && temp.next.frame_no!=frame_allocated)
             {
                 temp=temp.next;
             }
             
             if(temp.next!=null)
             {
                temp.next.processid = m_Process.ID;
                //n.next=temp.next;
                //temp.next=n;
             }
             else
             {
                temp.next=n;
             }
        }
	else
        {
	      memReq.head=n;
        }
    
                
        memReq.count++;
      }
     int EndFrame=m_Process.StartFrame+f;
      m_Process.EndFrame=temp.next.frame_no;
      
      System.out.println("\n"+"Allocated memory to Process "+m_Process.ID);
      System.out.println("Start Frame is "+m_Process.StartFrame+" and End Frame is "+m_Process.EndFrame);
      System.out.println("----------------------------------------"+"\n"); 
     
    return true;
}

  /**
   * This method dealloates memory allocated to a process
   * To deallocate, the processid is set to -1
   * @param pid
   * @return 0 or 1 indicating if the memory has been deallocated
   */

public boolean DeAllocate(PCB dealloc_Process)  //Returns one if memory has been deallocated
{
   ListNode temp;
   int i = 0;
   System.out.println("Deallocating memory for "+dealloc_Process.ID);
   System.out.println("Start Frame "+dealloc_Process.StartFrame+" End Frame "+dealloc_Process.EndFrame);

   for(temp=memReq.head; temp.next!=null;temp=temp.next)
   {
      if(temp.frame_no == dealloc_Process.StartFrame)
        break;
   }
  
   if(temp == null)
      return false;

           
   while(temp!=null && temp.processid == dealloc_Process.ID)
   {
       temp.processid=-1; //deallocate space in memReq
       temp=temp.next;
       no_of_freeframes++;
       memReq.count--;
   }
 
    return true;
        
}


   /**
    * Inner classes 
    */
class ListNode
{
    int frame_no;
    int processid;
    ListNode next;
}

class SinglyLinkedList
{
    public int count;                    // list size
    public ListNode head; // first elt

    public SinglyLinkedList()
    {
        head = null;
        count = 0;
    }
}//SingleLinkedList
}


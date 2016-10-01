import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.util.*;
import javax.swing.border.*; 

class Project
{
	public static void main(String[] args)
   	{
		DisplayMemoryFrame frame = new DisplayMemoryFrame();
      	frame.setTitle("Operating System(COSC 519): [Memory Management Project]");
      	frame.show();
   	}
}

class DisplayMemoryFrame extends JFrame implements AdjustmentListener
{  
	public DisplayMemoryFrame()
   	{
   		//*****************Screen setup********************
   		Toolkit tk = Toolkit.getDefaultToolkit();
		Dimension d = tk.getScreenSize();
		int screenHeight = d.height;
		int screenWidth = d.width;
		setSize(screenWidth, screenHeight);
		
		
		Image img = tk.getImage("519.gif");
		setIconImage(img);
		setResizable(false);
		//**************************************************
		
		//**Window Listner. Terminates program whenwindow closed**
		addWindowListener(new WindowAdapter()
								{
									public void windowClosing(WindowEvent e)
									{
										System.exit(0);
									}
								});
		//*********************************************************
		
		//*****************Button setup****************************
		Border border = null;
		JButton button;
      	buttonPanelN = new JPanel();
      	buttonPanelN.setLayout(new GridLayout(2, 2));
      	      	
/*      	button = new JButton("TIME ELAPSE");	    
	    buttonPanelN.add(button);
      	button.addActionListener(new ClickAction("TE"));
*/      	
       	button = new JButton("DEFRAGMANTATION");	    
	    buttonPanelN.add(button);
      	button.addActionListener(new ClickAction("DF"));
	  
/*	   	button = new JButton("ADD PROCESS");
	    buttonPanelN.add(button);
       	button.addActionListener(new ClickAction("AP"));
*/
	   	button = new JButton("SWAP PROCESS");
	    buttonPanelN.add(button);
      	button.addActionListener(new ClickAction("SP"));

		defragDisplay = new JTextArea("",1, 18);
      	defragDisplay.setEditable(false);
      	defragDisplay.setBackground(Color.lightGray);
      	border = BorderFactory.createLoweredBevelBorder();
      	Border titleEmpty = BorderFactory.createTitledBorder(border, "DEFRAGMENTATION INFORMATION");
      	defragDisplay.setBorder(titleEmpty);
       	buttonPanelN.add(defragDisplay);

		swapDisplay = new JTextArea("",1, 18);
      	swapDisplay.setEditable(false);
      	swapDisplay.setBackground(Color.lightGray);
      	border = BorderFactory.createLoweredBevelBorder();
      	Border titleSwap = BorderFactory.createTitledBorder(border, "SWAP INFORMATION");
      	swapDisplay.setBorder(titleSwap);
       	buttonPanelN.add(swapDisplay);

      	
      	border = BorderFactory.createMatteBorder(2,2,2,2,Color.blue);
      	buttonPanelN.setBorder(border);
		//*********************************************************	
		
		//***************Initial Memory display******************
	    pNewQ = new Queue(newQSize);
	    pReadyQ = new Queue(readyQSize);
	    mMang = new MemoryManagement(pNewQ, pReadyQ);
	    ShowMem = new JTextArea("");
	    mMang.formDisplay();
	    border = BorderFactory.createRaisedBevelBorder();
	    Border title1 = BorderFactory.createTitledBorder(border, "MAIN MEMORY");
	    ShowMem.setBackground(Color.cyan);
      	ShowMem.setBorder(title1);
      	ShowMem.setEditable(false);
      	JScrollPane scrollpaneM = new JScrollPane(ShowMem);
      	
      	//*********************************************************
      	
      	//******************Display west****************
      	displayW = new JPanel();
      	displayW.setLayout(new GridLayout(3, 18));
      	displayQ = new JPanel();
		displayQ.setLayout(new GridLayout(2,18));
			    
	    memoryInfo = new JTextArea("",1, 18);
	    memoryInfo.setEditable(false);
      	memoryInfo.setBackground(Color.orange);
      	border = BorderFactory.createLoweredBevelBorder();
      	Border title2 = BorderFactory.createTitledBorder(border, "MEMORY INFORMATION");
      	memoryInfo.setBorder(title2);
      	displayW.add(memoryInfo);
   		
      	processInfo = new JTextArea("",1, 18);
      	processInfo.setEditable(false);
      	processInfo.setBackground(Color.lightGray);
      	border = BorderFactory.createLoweredBevelBorder();
      	Border title3 = BorderFactory.createTitledBorder(border, "PROCESSOR SPECIFICATION");
      	processInfo.setBorder(title3);
      	JScrollPane scrollpaneP = new JScrollPane(processInfo);
       	displayW.add(scrollpaneP);
      	
       	newQueueInfo = new JTextArea("",1, 18);
       	newQueueInfo.setEditable(false);
       	newQueueInfo.setBackground(Color.orange);
       	border = BorderFactory.createLoweredBevelBorder();
       	Border title4 = BorderFactory.createTitledBorder(border, "NEW QUEUE");
      	newQueueInfo.setBorder(title4);
		JScrollPane scrollpaneNQ = new JScrollPane(newQueueInfo);
   		displayQ.add(scrollpaneNQ);
     	
      	readyQueueInfo = new JTextArea("",1, 18);
      	readyQueueInfo.setEditable(false);
      	readyQueueInfo.setBackground(Color.lightGray);
      	border = BorderFactory.createLoweredBevelBorder();
      	Border title5 = BorderFactory.createTitledBorder(border, "READY QUEUE");
      	readyQueueInfo.setBorder(title5);
		JScrollPane scrollpaneRQ = new JScrollPane(readyQueueInfo);
		displayQ.add(scrollpaneRQ);
		displayW.add(displayQ);
      	//*********************************************************
      	
      	//****************Display east*******************
		displayE = new JPanel();
		displayE.setLayout(new GridLayout(3, 18));
		displayCPU = new JPanel();
		displayCPU.setLayout(new GridLayout(2,18));
		JPanel displayTime = new JPanel();
		displayTime.setLayout(new GridLayout(2,18));

		timerDisplay = new JTextField("0");
		timerDisplay.setEditable(false);
		border = BorderFactory.createLoweredBevelBorder();
      	Border title6 = BorderFactory.createTitledBorder(border, "SYSTEM CLOCK");
      	timerDisplay.setBorder(title6);
		displayTime.add(timerDisplay);

		clockSpeed = new JScrollBar(Adjustable.HORIZONTAL,3000,1000,0,8000);
		clockSpeed.setBlockIncrement(500);
		clockSpeed.setUnitIncrement(500);
		clockSpeed.addAdjustmentListener(this);
		border = BorderFactory.createLoweredBevelBorder();
      	Border titleCS = BorderFactory.createTitledBorder(border, "TIME ELAPSE SPEED");
      	clockSpeed.setBorder(titleCS);
		displayTime.add(clockSpeed);
		
		displayCPU.add(displayTime);
		
				
		cpuDisplay = new JTextArea("",3,18);		//east
		cpuDisplay.setEditable(false);
		border = BorderFactory.createLoweredBevelBorder();
      	Border title7 = BorderFactory.createTitledBorder(border, "CPU EXECUTING");
      	cpuDisplay.setBorder(title7);
      	cpuDisplay.setBackground(Color.orange);
 		displayCPU.add(cpuDisplay);
 		displayE.add(displayCPU);
 		
 		proWaitTime = new JTextArea("",3,18);		//east
		proWaitTime.setEditable(false);
		border = BorderFactory.createLoweredBevelBorder();
      	Border title8 = BorderFactory.createTitledBorder(border, "PROCESS WAIT TIME");
      	proWaitTime.setBorder(title8);
      	proWaitTime.setBackground(Color.lightGray);
 		displayE.add(proWaitTime);
 		
		
		whatsUp = new JTextArea("",50,18);	
      	whatsUp.setEditable(false);
      	border = BorderFactory.createLoweredBevelBorder();
      	Border title9 = BorderFactory.createTitledBorder(border, "WHAT'S HAPPENING");
     	whatsUp.setBorder(title9);
      	whatsUp.setBackground(Color.orange);
     	JScrollPane scrollpane = new JScrollPane(whatsUp);
       	displayE.add(scrollpane);
       	
       	//*********************************************************
      	
      	//***********Putting displays in containers************
      	Container contentPane = getContentPane();
	    contentPane.add(displayE, "East");
	    contentPane.add(scrollpaneM, "Center");
	    contentPane.add(buttonPanelN, "North");
	    contentPane.add(displayW, "West");
	    //*********************************************************
	    
	    //********************Threads started**********************
   	    clk = new Clock();
      	proGen = new processGenerator(pNewQ); 
	    sch = new Scheduler(pReadyQ); 
	    //*********************************************************
 	}
	
	

	
		

	private JScrollBar clockSpeed;	
 	private JPanel displayCPU;
	private JPanel displayQ;
	private JPanel buttonPanelN;		//north
	private JPanel displayE;  			//east
	private JPanel displayW;			//west
	private JTextArea memoryInfo;		//west
	private JTextArea processInfo;		//west
	private JTextArea newQueueInfo;		//west 
	private JTextArea readyQueueInfo;	//west
	private JTextArea ShowMem;			//centre
	private JTextArea cpuDisplay;		//east
	private JTextArea whatsUp;			//east 
	private JTextField timerDisplay;	//east
	private JTextArea proWaitTime;		//east
	private JTextArea swapDisplay;	//north
	private JTextArea defragDisplay;	//north	

	private processGenerator proGen;		//Generates processes
	private MemoryManagement mMang;		//Manages memory 
	private Scheduler sch;				//Scheduler 
	private Clock clk;
	
	private process pg;				// process
	private Queue pNewQ;				// Process new queue
	private Queue pReadyQ;				// Process ready queue
	
	private int time1 = 3;				//Changes the speed of generating processes
	private int time2 = 5;				//Changes the speed of generating processes
	private static char pid = 'A';		//Process id starts with A
	private int pgCount = 0;			//Process counter
	private int newQSize = 20;			//New queue size
	private int readyQSize = 20;			//Ready queue size
	private static int TIME = 0; 			//System closk
	private int timeLength = 3000;		//Time gap
	//*********************Implements buttons***********************	
	
	public void adjustmentValueChanged(AdjustmentEvent evt)
	{	
		timeLength = clockSpeed.getValue();
	}
	
	private class ClickAction implements ActionListener
   	{ 
		public ClickAction(String p)
      	{ 
			action = p;
      	}

      	public void actionPerformed(ActionEvent event)
		{  
/*			if(action.equals("AP"))
			{
				whatsUp.setText("Adding Process\n");
			}
			else if(action.equals("TE"))
			{
				whatsUp.setText("time elapsed\n");
			}
*/			if(action.equals("SP"))
			{
				int start = TIME;
				process p = new process('#');
				mMang.swapProcess(p, start);
			}
			else if(action.equals("DF"))
			{
				mMang.defragment();
			}
      	}
      	private String action;
  	}
   	//*****************************************************
   	
   	//*****************Memory manager**********************   	
   	private class MemoryManagement extends Thread
   	{   		
   		final static int FRAME_SIZE = 128;
   		final static int TOTAL_FRAMES = 100;

   		LinkedList readyQ = new LinkedList();
   		process p;
   		process pReady;
   		Queue inputQ;
   		Queue readyQueue;
   		
   		
   		int fRequired;
   		char[] memoryArray = new char[TOTAL_FRAMES + 1];
		int totalMemory = FRAME_SIZE * TOTAL_FRAMES;
		int freeFrames;
   		int usedFrames;
   		double memoryUsePer;
   		int startAdd;
   		int numOfProcessInQ = 0;
		int totalFrames = 0;
		int totalUsedFrames = 0;
		int totalProcesses = 0;
		int processSize = 0;
		
		//****************Constructor************************
		MemoryManagement(Queue Q, Queue R)
		{
			inputQ = Q;
			readyQueue = R;
			numOfProcessInQ = 0;
			for(int i =0;i <TOTAL_FRAMES; ++i)
				memoryArray[i] = '0';
			start();
		}  
   		
   		//*****************Dispalys memory********************
   		public void formDisplay()
   		{
   			String memMap = "";
   			int i, j;
   			String fNum = "";
   			String fStatus;
   			String frameNum = "";
   			ShowMem.setText("");  			
   			
   			for(i = 0; i < TOTAL_FRAMES; ++i)
   			{
   				if(i<10)
   					fNum = "  " + i;
   				else
   					fNum = "" + i;	
   				
				ShowMem.append("          f(" + fNum + "):");  
   				ShowMem.append(frameNum);
   				if(memoryArray[i]=='0')
   				{
   					fStatus = "  <FREE>          ";
   	 				ShowMem.append(fStatus);
   				}
   				else
   				{
   					fStatus = "    [  P" + memoryArray[i] + "   ]           "; 
   					ShowMem.append(fStatus);
   				} 
				
   				fNum = "";
   				if(((i + 1) % 4) == 0)
   				{
   					ShowMem.append("\n");
   				}
   				if(((i + 1) % 12) == 0)
   				{
   					ShowMem.append("\n");
   				}	  
   			}
   		}
		
		//*****************Dispalys process info*******************
		public void displayProInfo(process p)
		{
			processInfo.append("\n\nProcess ID: " + p.processIdentity());
			processInfo.append("\nMemory requested: " + p.memRequested());
			processInfo.append("\nFrames Needed: " + p.framesNeeded());
			processInfo.append("\nStarting Frame: " + p.memoryStart());	
			processInfo.append("\nEnding Frame: " + p.memoryEnd());
			processInfo.append("\nExecution time: " + (float)p.processTime()/1000);
		} 

		//*****************Displays memory info*********************
		public void displayMemInfo()
		{
			totalUsedFrames += usedFrames;
			totalFrames += TOTAL_FRAMES; 
			memoryInfo.setText("Total memory: " + totalMemory + " Bytes");
			memoryInfo.append("\nFrame size: " + FRAME_SIZE);
			memoryInfo.append("\nTotal frames: " + TOTAL_FRAMES);
			memoryInfo.append("\nMemory used(Frames): " + usedFrames);
			memoryInfo.append("\nMemory Free(Frames): " + (TOTAL_FRAMES - usedFrames));
			memoryInfo.append("\nNumber of process: " + numOfProcessInQ);
			memoryInfo.append("\nProcess in ReadyQ till now: " + totalProcesses);
			memoryInfo.append("\nAverage Process size(Bytes): " + processSize/totalProcesses);			
				
			memoryInfo.append("\n\nPercent used: " + ((float)usedFrames/(float)TOTAL_FRAMES)*100);
			memoryInfo.append("\nAverage used(%): " + ((float)totalUsedFrames/(float)totalFrames)*100);

		} 

		//*********************Dispalys new queue*********************	
		public void displayNewQInfo()
		{
   			String str = inputQ.displayQ();
   			newQueueInfo.setText(str);
		}
		
		//**********************Dispalys ready queue********************
		public void displayReadyQInfo()
		{
   			String str = readyQueue.displayQ();
   			readyQueueInfo.setText(str);
		}
 		
 		//**********************Adding process to display**************
   		private void addToDisplay(process p)
  		{
   			char pid;
   			pid = p.processIdentity();
	  		totalProcesses++; 
	  		numOfProcessInQ++;
			processSize += p.memRequested();
			for(int i = p.memoryStart(); i <= p.memoryEnd(); ++i)
			{
				memoryArray[i] = pid;
			}
			usedFrames += fRequired;
  		}
  		
  		//***********************Removing process from display**********
  		private void removeFromDisplay(process p)
  		{
   			char pid;
   			pid = p.processIdentity();
	  		
	  		numOfProcessInQ--;
	  		for(int i = p.memoryStart(); i <= p.memoryEnd(); ++i)
			{
				memoryArray[i] = '0';
			}
			usedFrames -= p.framesNeeded();
  		}	

		//********************Finds if memory available********************
		private synchronized boolean memoryAvailable(process p) 
		{
			int memToAllot;
			boolean requiredMemAvailable;
			int j;
			
			memToAllot = p.memRequested();
			fRequired = (int)(((double)memToAllot/(double)FRAME_SIZE) + 0.99);
			p.requestedFrameSpace(fRequired);
			
			for(int i = 0; i < TOTAL_FRAMES; ++i)
			{
				j = 0;
				
				if(memoryArray[i] == '0')
				{
					startAdd = i;
					++j;
					while((memoryArray[i] == '0') && (i < TOTAL_FRAMES))
					{
						++j;
						++i;	
					}
					
					if(j >= fRequired)
					{
						p.memoryAlloted(startAdd);
						return true;
					}
				}
				
			}
			return false;
		}	
		
		//**************Runs thread********************		
	  	public void run()
	  	{
			try
			{	
				for(;;)
				{
					if(!(inputQ.isEmpty()))		// If new Q not empty
					{
						p = inputQ.peek();
						if(memoryAvailable(p))	//into Ready queue
						{
							
							p.inReadyTime();
							inputQ.get();
							displayNewQInfo();
							readyQueue.put(p);
							whatsUp.append("\nProcess in ready Q: " + p.processIdentity());
   							displayReadyQInfo();
   							addToDisplay(p);
   							displayProInfo(p);
							displayMemInfo();
   							formDisplay();
   							
   						}
   					}
   					if(!(readyQueue.isEmpty()))		// Execution
					{
						pReady = readyQueue.peek(); 
						if(pReady.testTermination())
						{
							p = readyQueue.get();
							whatsUp.append("\nProcess Removed: " + p.processIdentity());
							displayReadyQInfo();
							removeFromDisplay(pReady);
							displayMemInfo();
							formDisplay();
   							
						}
					}
					sleep(timeLength/10);
   				}
   			}catch(InterruptedException ie){
   				return;}
   		}

   		public void defragment()
   		{
   			LinkedList defragList;
   			defragList = readyQueue.copyReadyQ();
   			process pro;
   			int defragStart = TIME;
   			int defragEnd;
   			int totalTime;
   			
   			int freeSpaceCount;
   			for(int i = 0; i < TOTAL_FRAMES; ++i)
   			{
   				freeSpaceCount = 0;
   				while((memoryArray[i] == '0') && (i < TOTAL_FRAMES))
   				{
   					freeSpaceCount++;
   					++i;
   				}
   				if((freeSpaceCount > 0) && (i<TOTAL_FRAMES))
   				{
   					int qLength = defragList.size();
   					char proID = memoryArray[i];
   					
   					int index = 0;
   					do 
   					{
   						pro = (process)defragList.get(index);
   						++index;
   					}while((proID != pro.processIdentity()) && (index < qLength));
   					
   					int lastFrame = pro.memoryEnd();
   					int fragFirstFrame = i - freeSpaceCount; 
   					int fragLastFrame = fragFirstFrame + pro.framesNeeded() - 1;
   					
   					for(int j = fragFirstFrame; j <= fragLastFrame; ++j)
   					{
   						memoryArray[j] = pro.processIdentity();
   					}
   					for(int k = fragLastFrame + 1 ; k <= lastFrame; ++k)
   					{
   						memoryArray[k] = '0';
   					}
   					
   					i = fragLastFrame;
   					pro.memoryAlloted(fragFirstFrame);
   					
   					defragEnd = TIME + 1 +  TOTAL_FRAMES/100;
   					totalTime = (defragEnd )- defragStart;
   					defragDisplay.setText("Defrag started(ms): " + defragStart);
   					defragDisplay.append("\tDefrag ended(ms): " + defragEnd);
   					defragDisplay.append("\tDefrag Time(ms): " + totalTime);
   				}
   			}
   			formDisplay();
		}	
		public void swapProcess(process p, int s)
		{
			int swapStart = s;
			int swapEnd;
			int j;
			int i;
			process [] pTempHolder = new process[6];
			
			
			for(i = 0; !(memoryAvailable(p));++i )
			{
				if(!(readyQueue.isEmpty()))		// Execution
				{
					pTempHolder[i] = readyQueue.getLast();
					displayReadyQInfo();
					removeFromDisplay(pTempHolder[i]);
					displayMemInfo();
					formDisplay();
					whatsUp.append("\nRemoved for Priority Process: " + pTempHolder[i].processIdentity());
				}
			}
			
			if(inputQ.isFull())
			{
				while(!(inputQ.isFull()))
				{
					;
				}	
			}	
			inputQ.putFirst(p);
			displayNewQInfo();
			whatsUp.append("\nPriority process in NewQ: " + p.processIdentity()+ i);

			for(j = 0; j < i; ++j)
			{
				process q = pTempHolder[j]; 
				if(inputQ.isFull())
				{
					while(!(inputQ.isFull()))
					{
						;
					}	
				}	
				inputQ.putProcess(q);
				displayNewQInfo();
				whatsUp.append("\nProcess re-created: " + q.processIdentity());
			}

			swapEnd = TIME + 2 + i*2;
			swapDisplay.setText("Swap start(ms): " + swapStart);
			swapDisplay.append("\tSwap end(ms): " + swapEnd);
			swapDisplay.append("\tTotal swap time(ms): " + (swapEnd - swapStart) );
		}	
 	}
	
	//********************Generates processes rendomly*****************
	class processGenerator extends Thread
	{
		private process p;
		Queue outputQ;
				
		public processGenerator(Queue Q)
		{
			super("ProcessGenerator-Thread");
			start();
			outputQ = Q;
		}
		
		public void displayNewQInfo()
		{
   			String str = outputQ.displayQ();
   			newQueueInfo.setText(str);
		}

		public void run()
		{
			try
			{
				for(;;)
				{
					if(!(outputQ.isFull()))
					{
						p = new process();
						p.inCreateTime();
						outputQ.put(p);
						displayNewQInfo();
						whatsUp.append("\nProcess created: " + p.processIdentity());
					}
					
					long delay = (long)((Math.random() * time1) + ((Math.random() - Math.random()) * time2));
					if(delay < 0)
					{
						delay *= -1;
					}
					sleep(delay * timeLength);
				}
			}catch(InterruptedException ie){ return;}
		}
	}
					
	private class Queue
	{
		private LinkedList qHolder = new LinkedList();
		private process p;
		private int numProcessInNewQ = 0;
		final int MAX_PROCESS_IN_NEWQ;
		
		Queue()
		{
			MAX_PROCESS_IN_NEWQ = 10;
		}
		
		Queue(int s)
		{
			MAX_PROCESS_IN_NEWQ = s;
		}
				
		public int queueSize()
		{
			return numProcessInNewQ;
		}
		
		public synchronized process get() throws InterruptedException
		{
			while(isEmpty())
			{
				wait();
			}
			notify();
			return getProcess();
		}
		
		public synchronized void put(process p) throws InterruptedException
		{
			while(isFull())
			{
				wait();
			}
			notify();
			putProcess(p);
		}
		
		public synchronized process peek() throws InterruptedException
		{
			while(isEmpty())
			{
				wait();
			}
			notify();
			return peekProcess();
		}
		
		private boolean hasPriorityProcess(process p)
		{
			return qHolder.contains(p);
		}	
					
		private process getProcess()
		{
			numProcessInNewQ--;
			return (process)qHolder.removeFirst();
		}
		
		private process getLast()
		{
			numProcessInNewQ--;
			return (process)qHolder.removeLast();
		}
		
		private process peekProcess()
		{
			return (process)qHolder.getFirst();
		}
		
		private void putFirst(process p)
		{
			numProcessInNewQ++;
			qHolder.addFirst(p);
		}
		
		private void putProcess(process p)
		{
			numProcessInNewQ++;
			qHolder.addLast(p);
		}
		
		public boolean isEmpty()
		{
			return(numProcessInNewQ == 0);
		}
		
		public boolean isFull()
		{
			return(numProcessInNewQ == MAX_PROCESS_IN_NEWQ);
		}
		
		public synchronized String displayQ() 
		{
			int qLength = qHolder.size();
			String temp = "";
			
			for(int i=0;i < qLength; ++i)
			{
				p = (process)qHolder.get(i);
				temp +=  ("[" + p.processIdentity() + " ]");
			}
			temp += "\n";
			return temp;
		}
		private LinkedList copyReadyQ()
		{
			return qHolder;
		}
				 
	}
	   	
   	private class process
   	{
   		private int spaceRequested;
   		private int loadSpace;
   		private int executionTime;
   		private int timeCounter;
   		private char processID;
   		private int framesRequested;
  		private int firstFrame;
  		private int lastFrame;
  		private boolean terminated;
  		
		private int pCreateTime;
		private int pReadyTime;
		private int pExecTime;

  		
   		process()
   		{
   			terminated = false;
   			timeCounter =0;
   			processID = pid;
   			++pid;
   			double r = java.lang.Math.random();
   			double s = java.lang.Math.random();
   			spaceRequested = (int)((5600 * r+ 700 * s)  + (772 * r - 1900*s) );
   			if(spaceRequested < 0)
   			{
   				spaceRequested *= -1;
   			}
   			loadSpace = (int)(spaceRequested / 5) ;
   			executionTime = 2 + (int)(1000*(spaceRequested / 350 ));
   		}
   		
   		process(char ch)
   		{
   			terminated = false;
   			timeCounter =0;
   			processID = ch;
   			double r = java.lang.Math.random();
   			double s = java.lang.Math.random();
   			spaceRequested = (int)((5600 * r+ 700 * s)  + (772 * r - 1900*s) );
   			if(spaceRequested < 0)
   			{
   				spaceRequested *= -1;
   			}
   			loadSpace = (int)(spaceRequested / 5) ;
   			executionTime = 2 + (int)(1000*(spaceRequested / 350 ));
   		}
   		
   		public void memoryAlloted(int x)
   		{
   			firstFrame = x;
   		}
   		
   		public int memoryStart()
   		{
   			return firstFrame ;
   		}
   		
   		public int memoryEnd()
   		{
   			lastFrame = firstFrame + framesRequested - 1;
   			return lastFrame;
   		}
   		
   		public char processIdentity()
   		{
   			return processID;
   		}
   	
   		
   		public int memRequested()
   		{
   			return spaceRequested;
   		}
   		public int loadingSpace()
   		{
   			return loadSpace;
   		}
   		public int processTime()
   		{
   			return executionTime;
   		}
   		public int processRunningFor()
   		{
   			return timeCounter;
   		}
   		public void requestedFrameSpace(int fn)
   		{
   			framesRequested = fn;
   		}
   		public int framesNeeded()
   		{
   			return framesRequested;
   		}
   		public void terminated(boolean b)
   		{
   			terminated = b;
   		}
   		
   		public boolean testTermination()
   		{
   			return terminated;
   		}
   		
   		public void inCreateTime()
		{
			pCreateTime = TIME;
		}
		
		public int outCreateTime()
		{
			return pCreateTime;
		}
		
		public void inReadyTime()
		{
			pReadyTime = TIME;
		}
		
		public int outReadyTime()
		{
			return pReadyTime;
		}
		
		public void inExecTime()
		{
			pExecTime = TIME;
		}
		
		public int outExecTime()
		{
			return pExecTime;
		}
    }
   	
   	private class Scheduler extends Thread
   	{
   		process pR;
   		Queue runningQ;
   		int clock;
   		int totalTime;
   		int totalWaitTime = 0;
   		int waitTime = 0;
   		int processExecuted = 0;
   		int totalTimeInMem = 0;
   		int timeInMem = 0;
   		
   		public Scheduler(Queue Q)
		{
			super("Scheduler-Thread");
			start();
			runningQ = Q;
		}
		
		
		public void run()
		{
			try
			{
				for(;;)
				{
					if(!(runningQ.isEmpty()))
					{
						pR = runningQ.peek();
						pR.inExecTime();
						whatsUp.append("\nProcess running: " + pR.processIdentity());
						   						
   						totalTime = pR.processTime();
   						int execStart = pR.outExecTime();
   						while(totalTime >= (TIME - execStart))
   						{
   							cpuDisplay.setText("PROCESS BEING EXECUTED: " + pR.processIdentity());
   							cpuDisplay.append("\nPROCESS TIME LEFT: " + (float)(totalTime - (TIME - execStart))/1000);
   							sleep(timeLength);
   						}
						whatsUp.append("\nProcess Terminated: " + pR.processIdentity());
   						++processExecuted;
						pR.terminated(true);
						
						waitTime = execStart - pR.outCreateTime();
						totalWaitTime += waitTime; 
						int execEnd = execStart + totalTime;
						timeInMem = execEnd - pR.outReadyTime();
						totalTimeInMem += timeInMem;
						
						proWaitTime.setText("PROCESS: " + 	pR.processIdentity());
						proWaitTime.append("\nCreated at: " + (float)pR.outCreateTime()/1000);
						proWaitTime.append("\nReady at: " + (float)pR.outReadyTime()/1000);
						proWaitTime.append("\nExection start: " + (float)execStart/1000);
						proWaitTime.append("\nExecution end: " + (float)execEnd/1000);
						proWaitTime.append("\nTotal wait: " + (float)waitTime/1000);
						proWaitTime.append("\nTotal time in memory: " + (float)(timeInMem)/1000);
						proWaitTime.append("\n\nAverage wait time: " + ((float)totalWaitTime/processExecuted)/1000);
						proWaitTime.append("\nAverage time in memory: " + ((float)totalTimeInMem/processExecuted)/1000);
						sleep(250);
					}
					sleep(timeLength);
				}
			}catch(InterruptedException ie){ return;}
		}
   	}
   	
   	private class Clock extends Thread
   	{
		private int clock = 0;

   		public Clock()
		{
			super("Clock-Thread");
			start();
		}
		
		
		public void run()
		{
			try
			{
				for(;;)
				{
					sleep(timeLength/1000);
					TIME++;
					if((TIME % 1000)== 0)
					{	
						++clock;
						timerDisplay.setText("CLOCK(s): " + clock);
					}
				}
			}catch(InterruptedException ie){ return;}
		}
   	}
}


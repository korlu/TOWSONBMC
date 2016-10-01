/*
 * PCB.java
 *
 * 

/**
 *
 *@autor Eric Avery,Jyotsna Vodela,Vijita Mathur,Tong Li
 *COSC 519 project


 */

import java.lang.*;
import java.util.*;

public class PCB extends java.lang.Object {
    
    public int ID = -1;
    
    public long MemUsage = 0;
    
    public int StartFrame = -1;
    
    public int EndFrame = -1;
    
    public int TotalRunTime = 0;
    
    public int CurrentRunTime = 0;
    
    public Date StartTime = new Date();
    
    /** Creates a new instance of PCB */
    public PCB() 
    {
    }
    
    public void SetFrames(int Start, int End)
    {
       StartFrame = Start;
       EndFrame = End;
    }
    
    public int GetNumFramesUsed()
    {
        return EndFrame - StartFrame + 1;
    }
}

/*
 * ProcessorCallBack.java
 *
 * 
 */

/**
 *
*@autor Eric Avery,Jyotsna Vodela,Vijita Mathur,Tong Li
 *COSC 519 project
 */
public interface ProcessorCallBack 
{
    
    public void NewProcessCreated(PCB PInfo);
    
    public void ProcessCompleted(PCB PInfo);
    
    public void NewProcessReady(PCB PInfo);
    
    public void ProcessStarted(PCB PInfo);
    
    public void ProcessFramesMoved(PCB PInfo);
}

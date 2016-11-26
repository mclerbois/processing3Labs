
import javax.swing.JFrame;
import javax.swing.JPanel;

import processing.awt.PSurfaceAWT.SmoothCanvas;
import processing.core.PApplet;
import processing.core.PSurface;

import java.awt.*;
import javax.swing.*;

abstract class processingPanel extends PApplet {
  protected PSurface   ps;
  protected JPanel     panel;
  protected int panelWidth;
  protected int panelHeigth;
  
  public abstract void settings();
  public abstract void _draw();
  
  public void draw() {
    checkPanelSize(); 
    _draw();
    }
  
  protected void checkPanelSize() {
    if ((panel.getWidth()!=panelWidth) && (panel.getHeight()!=panelHeigth))
      ps.setSize(panel.getWidth(),panel.getHeight());
    }

  public void main(JPanel p) {
    panel=p;
    //get the PSurface from the sketch
    ps = this.initSurface();
    ps.setSize(200,200);
    //get the SmoothCanvas that holds the PSurface
    SmoothCanvas smoothCanvas = (SmoothCanvas)ps.getNative();
    panel.add(smoothCanvas);
    //start your sketch
    ps.startThread();
  }

}
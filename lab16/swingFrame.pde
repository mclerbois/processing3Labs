import java.awt.*;
import javax.swing.*;
import javax.swing.JButton;
 

// création de fenêtre

public class  simpleFrame extends JFrame {
  
  // constructeur
  public simpleFrame( String title,boolean quitOnClose) {
    setLayout(new GridLayout(1, 1));
    setDefaultCloseOperation(quitOnClose ?  JFrame.EXIT_ON_CLOSE : JFrame.HIDE_ON_CLOSE);
    this.setTitle(title); 
    mainProcessingPanel p=new mainProcessingPanel();
    JPanel pane=new JPanel();
    p.main(pane);
    add(pane);
    pack();
    this.setVisible(true);
  }
  

}

class  mainProcessingPanel extends processingPanel {
  
  void settings(){
  
    }

  void _draw() {
    background(0);
    fill(color(0,0,250));
    ellipse(mouseX, mouseY, 20, 20);
    }
}
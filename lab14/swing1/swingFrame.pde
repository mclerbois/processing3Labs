import java.awt.*;
import javax.swing.*;

 

// création de fenêtre

public class  simpleFrame extends JFrame {
  
  // constructeur
  public simpleFrame( String title,boolean quitOnClose) {
    setPreferredSize(new Dimension(200, 200));
    setLayout(new BorderLayout());
    setDefaultCloseOperation(quitOnClose ?  JFrame.EXIT_ON_CLOSE : JFrame.HIDE_ON_CLOSE);
    this.setTitle(title); 
    pack();
    this.setVisible(true);
  }
  

}
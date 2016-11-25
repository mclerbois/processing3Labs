import java.awt.*;
import javax.swing.*;

// création de fenêtre

public class  simpleFrame extends JFrame {

  // constructeur
  public simpleFrame( String title) {
    //setPreferredSize(new Dimension(200, 200));

    setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    this.setTitle(title);
    
    Container c = getContentPane();

    JPanel p1 = new JPanel();
    p1.setLayout(new BorderLayout());
    p1.add(new JButton("A"), BorderLayout.NORTH);
    p1.add(new JButton("B"), BorderLayout.WEST);
    p1.add(new JButton("C"), BorderLayout.CENTER);
    p1.add(new JButton("D"), BorderLayout.EAST);
    p1.add(new JButton("E"), BorderLayout.SOUTH);

    JPanel p2 = new JPanel();
    p2.setLayout(new GridLayout(3, 2));
    p2.add(new JButton("F"));
    p2.add(new JButton("G"));
    p2.add(new JButton("H"));
    p2.add(new JButton("I"));
    p2.add(new JButton("J"));
    p2.add(new JButton("K"));

    JPanel p3 = new JPanel();
    p3.setLayout(new BoxLayout(p3, BoxLayout.Y_AXIS));
    p3.add(new JButton("L"));
    p3.add(new JButton("M"));
    p3.add(new JButton("N"));
    p3.add(new JButton("O"));
    p3.add(new JButton("P"));

    c.setLayout(new BorderLayout());
    c.add(p1, BorderLayout.CENTER);
    c.add(p2, BorderLayout.SOUTH);
    c.add(p3, BorderLayout.EAST);

    pack();
    this.setVisible(true);
  }

}
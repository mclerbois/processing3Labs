import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import javax.swing.event.*;
import java.io.IOException;

// création de fenêtre

public class  simpleVue extends JFrame  implements ActionListener, Observer {
  private toggleButton[] onOffs;
  private indicator[] leds;
  private AbstractControler controler;


  /****************************************************************/
  // constructeur
  public simpleVue( String title, AbstractControler controler) {
    this.controler=controler;
    setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    this.setTitle(title);

    Container c = getContentPane();
    c.setLayout(new GridLayout(1, 16));

    onOffs=new toggleButton[10];
    for (int i=0; i<10; i++) {
      onOffs[i]= new toggleButton(i);
      onOffs[i].addActionListener(this);
      c.add(onOffs[i]);
    }

    leds=new indicator[6];
    for (int i=0; i<6; i++) {
      leds[i]= new indicator(i);  
      c.add(leds[i]);
    }

    pack();
    this.setVisible(true);
  }

  /****************************************************************/
  public  void    actionPerformed(ActionEvent e) {
    Object  source=e.getSource();
    ((toggleButton)source).changeState();
    controler.change(((toggleButton)source).getId(), ((toggleButton)source).getState());
  }

  /****************************************************************/
  // La mise à jour est simple dans ce cas, on autorise le rafraichissement de l'écran
  public void update(Observable obs, Object obj) {

    int index=(int) obj;
    
    if (index==13) { // si la valeur logique d'indice 13 à changé, c'est à cause de la tempo
      // la sortie 11 recopie le complément de la 13
      change(11, !get(13)); // 11 recopie 13
      }
    // rafraichissement des leds
    if (index>9) {
      leds[index-10].change(controler.get(index));
    }
  }

  /****************************************************************/
  // un événement propoqué par la vue est communiqué au controleur qui ...
  public void change(int index, boolean value) {
    this.controler.change(index, value);
  }

  // une demande de lecture de la vue passe par le contrôleur
  public boolean get(int index) {
    return this.controler.get(index);
  }
}

/****************************************************************/

class indicator extends JLabel {
  private String onImage="icon_led_red_on.png";
  private String offImage="icon_led_red_off.png";
  
  private ImageIcon  button_off;
  private ImageIcon  button_on;
  
  private boolean state=false;
  private int id;
  
  /****************************************************************/
  public indicator(int id) {
    this.id=id;
    offImage=dataPath("")+"\\images\\"+offImage;
    onImage=dataPath("")+"\\images\\"+onImage;
    button_off=new ImageIcon(((new ImageIcon(offImage)).getImage()).getScaledInstance(48, 48, java.awt.Image.SCALE_SMOOTH));
    button_on=new ImageIcon(((new ImageIcon(onImage)).getImage()).getScaledInstance(48, 48, java.awt.Image.SCALE_SMOOTH));
    this.setIcon(button_off);
    //this.setOpaque(false);
    }
    
  /****************************************************************/
  public void change(boolean state) {
    if (this.state==state)
      return;
    this.state=state;
    setIcon(state ? button_on : button_off);
    }
    
}
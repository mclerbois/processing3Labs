

class toggleButton extends JButton {
  private String onImage="switch2.png";
  private String offImage="switch2_off.png";
  
  private ImageIcon  button_off;
  private ImageIcon  button_on;
  
  private boolean state=false;
  private int id;
  
  /****************************************************************/
  // constructor
  public toggleButton(int id) {
    this.id=id;
    offImage=dataPath("")+"\\images\\"+offImage;
    onImage=dataPath("")+"\\images\\"+onImage;
    button_off=new ImageIcon(((new ImageIcon(offImage)).getImage()).getScaledInstance(48, 144, java.awt.Image.SCALE_SMOOTH));
    button_on=new ImageIcon(((new ImageIcon(onImage)).getImage()).getScaledInstance(48, 144, java.awt.Image.SCALE_SMOOTH));
    this.setIcon(button_off);
    this.setBorderPainted(false); 
    this.setContentAreaFilled(false); 
    this.setFocusPainted(false); 
    this.setOpaque(false);
    }    
  
  /****************************************************************/
  public boolean getState() {return state;}
  /****************************************************************/
  public int getId() {return id;}
  
  /****************************************************************/
  public void changeState() {
    state=!state;
    setIcon(state ? button_on : button_off);
    }
    
}
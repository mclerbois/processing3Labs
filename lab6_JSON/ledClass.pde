
// Nouveau type de variable, object

class ledClass {
  private int x,y;
  private PImage[] images;
  private int index;
  
  // constructeur
  public ledClass(JSONObject params) {
    x=params.getInt("x");
    y=params.getInt("y");
    index=0; // index par défaut lors de la création, on choisit la première image == off
    images=new PImage[2]; // définition du nombre d'image et donc de la dimension du tableau
    images[0]=loadImage(params.getString("offImage"));  // lecture de la première image
    images[1]=loadImage(params.getString("onImage"));   // lecture de la seconde image
    }
  
  // fonction de dessin
  public void draw(){    
      image(images[index],x,y);
    }
  
  // fonction pour allumer la diode led
  public void on() {
    index=1;
    }
    
  // fonction pour éteindre la diode led
  public void off() {
    index=0;
    }
  
  // fonction pour changer l'état de la diode led
  public void toggle() {
    index=(index==0) ? 1 : 0;
    }
    
  // fonction pour changer l'état la diode led
  public void change(boolean newState) {
    index=newState ? 1 : 0;
    }
    
  // fonction pour lire l'état de la diode
  public boolean state() {
    return (index==1) ? true : false;
  }
};
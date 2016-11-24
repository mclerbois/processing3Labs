

// déclaration d'un objet Square (implements) et implémentant (en +) les propriétés et méthodes de l'interface nommée Gform

class Square  implements Gform {
  int x,y,l;  // propriétés propres à un carré
  
  // constructeur
  public Square(int x, int y, int l) {
    this.x=x;
    this.y=y;
    this.l=l;
    }

  // implémentation de la méthode draw prévue dans l'interface
  public void draw() {
    rect(x,y,l,l);
    };
    
  // implémentation de la méthode getId prévue dans l'interface
  public int getId() { 
    return id; 
    }
  
  // implémentation de la méthode getSurface prévue dans l'interface
  int getSurface(){
    return l*l;
    };

    
  // implémentation de la méthode className prévue dans l'interface
  String className(){
    return this.getClass().getSimpleName();
    };
    
  // méthode propre au carré, non prévue dans l'interface
  int[] getCenter() {
    int[] center=new int[2];
    center[0]=x+l/2;
    center[1]=y+l/2;
    return center;
  }
}
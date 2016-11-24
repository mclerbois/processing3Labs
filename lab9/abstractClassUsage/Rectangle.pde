

// déclaration d'un objet Rectangle (implements) et implémentant (en +) les propriétés et méthodes de l'interface nommée Gform

class Rectangle extends Gform {
  
  // constructeur
  public Rectangle(int x, int y, int w, int h) {
    super(x,y,w,h);          // utilise le constructeur de la classe abstraite
    }
    
  // implémentation de la méthode draw prévue dans l'interface
  public void draw() {
    rect(x,y,w,h);
    };
    
 // méthode pour déterminer si la coordonnée x,y appartient à la surface de l'objet.
  public boolean isInside(int x,int y){
   // a vous de trouver le code
   
    return false;
  };
}
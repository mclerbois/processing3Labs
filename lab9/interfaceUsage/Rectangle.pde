

// déclaration d'un objet Rectangle (implements) et implémentant (en +) les propriétés et méthodes de l'interface nommée Gform

class Rectangle implements Gform {
  int x,y,width,height;  // propriétés propres à un rectangle
  
  // constructeur
  public Rectangle(int x, int y, int w, int h) {
    this.x=x;
    this.y=y;
    this.width=w;
    this.height=h;
    }
    
  // implémentation de la méthode draw prévue dans l'interface
  public void draw() {
    rect(x,y,width,height);
    };
    
  // implémentation de la méthode getId prévue dans l'interface
  public int getId() { return id; }

  // implémentation de la méthode getSurface prévue dans l'interface
  int getSurface(){return width*height;};
  
  // implémentation de la méthode className prévue dans l'interface
  // getClass est une méthode qui est automatiquement ajoutée à chaque objet quelque soit sa classe
  // getClass        https://docs.oracle.com/javase/7/docs/api/java/lang/Object.html#getClass()
  // getSimpleName() https://docs.oracle.com/javase/7/docs/api/java/lang/Class.html#getSimpleName()
  
  String className(){
    return this.getClass().getSimpleName();
    };
}
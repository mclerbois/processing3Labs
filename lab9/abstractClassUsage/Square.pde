

// déclaration d'un objet Square (implements) et implémentant (en +) les propriétés et méthodes de l'interface nommée Gform

class Square  extends Gform {

  // constructeur
  public Square(int x, int y, int l) {
    super(x,y,l,l);          // utilise le constructeur de la classe abstraite
    }

  // implémentation de la méthode draw prévue dans l'interface
  public void draw() {
    rect(x,y,w,h);
    };
    

  // méthode propre au carré, non prévue dans la classe abstraite
  int[] getCenter() {
    int[] center=new int[2];
    center[0]=x+w/2;
    center[1]=y+h/2;
    return center;
  }
  
  // méthode pour déterminer si la coordonnée x,y appartient à la surface de l'objet.
  public boolean isInside(int x,int y){
   // a vous de trouver le code
   
    return false;
  };
}

/*****************************************************************************************/
// Autre solution, le carré est un Rectanle particulier donc un descendant de rectangle

/*

class Square  extends Rectangle{

  // constructeur
  public Square(int x, int y, int l) {
    super(x,y,l,l);          // utilise le constructeur de la classe abstraite
    }

  // méthode propre au carré, non prévue dans la classe abstraite
  int[] getCenter() {
    int[] center=new int[2];
    center[0]=x+w/2;
    center[1]=y+h/2;
    return center;
  }
  
 // on utilise la méthode draw du rectangle
 // on utilise la méthode isInside du rectangle
 
}

*/
// déclaration d'un objet cercle descendant de Ellipse lui même descendant de Gform
// cercle est donc descendant de Gform (Deuxième génération)

class Circle  extends Ellipse {
  private int r;                // on ajoute la propriét mémorisant la valeur du rayon
  
  // constructeur, coordonné du centre et rayon
  public Circle(int cx, int cy, int r) {
    super(cx-r,cy-r,2*r,2*r);          // utilise le constructeur de la classe abstraite
    this.r=r;
    }
  
  // surcharge de la méthode de calcul pour le circle, elle remplace celle définie dans Gform
  // cette méthode retournera un nombre non entier (float)
  public Number getSurface(){
    return PI*pow(((float)r),2);
    };  
    
  // méthode pour déterminer si la coordonnée x,y appartient à la surface de l'objet.
  public boolean isInside(int x,int y){
   // a vous de trouver le code
   // la distance du point x,y au centre cx,cy doit être inférieure ou égale au rayon
   
    return false;
  };
}

/*********************************************/
// déclaration d'un objet coloredCircle descendant de Cercle  lui même descendant de Ellipse lui même descendant de Gform
// cercle est donc descendant de Gform (Troisième génération)

class coloredCircle extends Circle {
  private color strokeColor,fillColor; // nouvelle propriété, les couleurs utilisées pour dessiner les cercles colorés.
  
  public coloredCircle(int cx, int cy, int r,color strokeColor,color fillColor ) {
    super(cx,cy,r);          // utilise le constructeur de la classe abstraite
    this.strokeColor=strokeColor;
    this.fillColor=fillColor;
    }
    
  public void draw(){
    stroke(strokeColor);
    fill(fillColor);
    super.draw();
    }  
  
}
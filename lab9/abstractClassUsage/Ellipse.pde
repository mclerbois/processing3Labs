// déclaration d'un objet cercle

class Ellipse  extends Gform {

  // constructeur, coordonné du centre et rayon
  public Ellipse(int x, int y, int w,int h) {
    super(x,y,w,h);          // utilise le constructeur de la classe abstraite
    }

  // implémentation de la méthode draw prévue dans l'interface
  public void draw() {
    ellipse(x,y,w,h);
    };
  
  // surcharge de la méthode de calcul pour le circle, elle remplace celle définie dans Gform
  // cette méthode retournera un nombre non entier (float)
  public Number getSurface(){
    return PI*((float)w)*((float)h)/4;
    };  
    
  // méthode pour déterminer si la coordonnée x,y appartient à la surface de l'objet.
  public boolean isInside(int x,int y){
   // a vous de trouver le code, la somme des distances du point au deux foyers de l'ellipse est égale au grand axe
   // il faudra calculer la coordonnée du centre de l'ellipse (intersection du grand axe et du petit axe) (x-w/2),(y-h*2)
   // faire une changement de coordonnée pour que ce centre soit l'origine du nouveau système d'axe
   // calculer les coordonnées des foyers f1 et f2 soit (-f,0) et (+f,0)
   // calculer la somme des distances du point (x-cx),(y-cy) par rapport à f1 et f2.
   // si cette somme est inférieure ou égale à la longeur w du grand axe alors le point est dans l'ellipse
   
    return false;
  };  
  
}
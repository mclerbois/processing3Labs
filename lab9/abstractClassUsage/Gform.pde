/*

  La notion de class abstraite en Java

  Supposons que l'on désire dessiner des formes géométriques différents à l'écran sans vraiment savoir ce que l'on dessine
  
*/

// déclaration de la classe abstraite
abstract class Gform {
  protected int x,y,w,h;    // variable contenant les coordonnées du coin supérieur gauche de la forme
  
  abstract void draw(); // méthode qui dessine la forme géométrique, devra être définie par les descendants de la classe abstraite

  // constructeur
  public Gform(int x, int y,int w, int h) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    }
    
  public int getX(){ // méthode non abstraite, peut être redéfinie par un descendant
    return x;
    }; 
    
  public int getY(){// méthode non abstraite, peut être redéfinie par un descendant
    return y;
    }; // méthode non abstraite, peut être redéfinie par un descendant
  
  public String className(){  // méthode non abstraite, peut être redéfinie par un descendant
    return this.getClass().getSimpleName();
  }
  
  // cette méthode retournera un nombre entier car w et h sont des nombres entiers
  public  Number getSurface(){
    return w*h;
    };
   
  // méthode abstraite à construire dans chaque descendant pour déterminer si la coordonnée x,y appartient à la surface de l'objet.
  public abstract boolean isInside(int x,int y);
}
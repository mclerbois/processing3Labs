
// Nouveau type de variable, object

class switchClass {

  private int px,py; // mémorisation de la position du switch
  private PImage[] images;
  private int index;
  
  // constructeur
  public switchClass(String swOffFile, String swOnFile) {
    index=0; // index par défaut lors de la création, on choisit la première image == off
    images=new PImage[2]; // définition du nombre d'image et donc de la dimension du tableau
    images[0]=loadImage(swOffFile);  // lecture de la première image
    images[1]=loadImage(swOnFile);   // lecture de la seconde image
    }
  
  // fonction de dessin
  public void draw(int x,int y){  
      px=x;
      py=y;
      image(images[index],x,y);
    }
  
    
  // fonction pour lire l'état du switch
  public boolean state() {
    return (index==1) ? true : false;
  }
  
  // fonction pour déterminer si on à cliqué sur le switch
  // retourne vrai si on a agit sur ce switch
  public boolean OnMouseClicked(){
    if ( (mouseX>px) && (mouseX<(px+images[0].width)) && (mouseY>py) && (mouseY<(py+images[0].height)) ){
      index=(index==0) ? 1 : 0;
      return true;
    }
    else
      return false;
  }
};
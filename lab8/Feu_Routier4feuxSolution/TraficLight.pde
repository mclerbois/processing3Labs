/*


*/


class TraficLight{
  
  private  int state;
  private  PImage[] images; // On définit un tableau d'images de nom "images" sans dimension pour l'instant
  
  // Constructeur -----------------------------------------------
  TraficLight(){
    state=0;
    images= new PImage[5];
    images[0]=loadImage("images/feuxRouge.png");
    images[1]=loadImage("images/feuxVert.png");
    images[2]=loadImage("images/feuxOrange.png");
    images[3]=loadImage("images/feuxEteint.png");
    images[4]=loadImage("images/feuxVertGauche.png");
    } // Fin du constructeur TraficLight()

  // Méthode draw ================================================
  void draw(int x, int y){
    image(images[state],x,y); 
    }
    
  // Méthode changeState =========================================
  void changeState(int newState) {
    if (newState<images.length)
      state=newState;
    }

  } // Fin de l'objet TraficLight
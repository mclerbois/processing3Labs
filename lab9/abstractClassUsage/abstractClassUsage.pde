
/*
  La notion de class abstraite en Java
  Cette notion existe en C++
  
  Supposons que l'on désire dessiner des formes géométriques différents à l'écran sans vraiment savoir ce que l'on dessine
  
  on crée un interface nommé gFrom qui décrit les proprités et méthodes indispensable des formes géométriques que nous dessinerons
  
  1) lire le fichier (onglet) Gform qui déclare l'interface  (répondre aux questions)
  2) lire le fichier (onglet) Rectangle                      (répondre aux questions)
  3) lire le fichier (onglet) Square                         (répondre aux questions)
  4) lire le fichier (onglet) Ellipse                        (répondre aux questions)
  5) lire le fichier (onglet) Cercle                         (répondre aux questions)
  6) lire le code ci-dessous
  
*/

// Déclaration et affectation d'un tableau de forme géométrique
// la dimension du tableau et son contenu sont définit durant l'affectation formTab={...};
Gform[] formTab = {                      // un tableau de formes géométriques
  new Rectangle(10,10,100,50),           // une première forme, un rectangle
  new Square(10,70,20),                   // une deuxième forme, un carré
  new Ellipse(200,200,100,50),
  new coloredCircle(100,100,30,color(0,0,255),color(255,0,0))
  };                                     // utilisable

// je peut déclarer une variable avec le type Gform, mais il faudra l'affecter avec ...
Gform a=new Rectangle(0,0,10,10); // affectation avec une objet de la classe Rectangle, utilisable
Gform b; // non affectée, dont non utilisable

color  defaultStrokeColor = 0; // couleur des traits par défaut
color  defaultFillColor=255;   // couleur de remplissage par défaut

/**********************************************************************************************/
// procédure exécutée une seule fois
void setup(){

  // retiter les commentaires de la ligne ci-dessous, que constatez-vous.
  //print("Le centre de a=");println(((Square)a).getCenter()); // a est un rectangle ??? 
  
  // retiter les commentaires de la ligne ci-dessous, que constatez-vous.
  //b=new Gform();           // affectation avec une objet de la classe Gform ! (Il me semble que la classe Gform n'existe pas!)
   
  
  size(400,400); // dimension de la fenêtre affichée
  
  // affichage de caractéristique accessible des formes géométriques
  // foreach Gform item named g in the Gform Array named formTab
  // : doit être lu comme in
  
  for(Gform g : formTab ) {  // équivalent à => foreach Gform item named g in the Gform Array named formTab
    
    print("X is ");println(g.getX());
    print("Surface value is ");println(g.getSurface());
    print("Surface variable type is");println(g.getSurface().getClass().getSimpleName());
    print("ClassName is ");println(g.className());
    
    // Si la forme géométrique est un carré alors la méthode getCenter() est utilisable
    if (g.className().equals("Square")) {
      println("Center is at ");
      println(((Square)g).getCenter()); // ((Square)g) permet de forcer la variable g à être vue comme un Square et non Gfrom.
      }
      
    // retirer le commentaire de la ligne ci-dessous, que constater vous
    //println(g.getCenter());
    
    }
    
    // A faire.
      // calculer et afficher la somme des surfaces des formes géométriques contenues dans formTab;  
      // déclarer une variable entière nomée somme et l'affecter avec la valeur 0
      // for ( ... ) { ... } // calculer la somme
      // print("La somme=");println(...);
      
}

/**********************************************************************************************/
void draw(){
  background(200);
  
  // foreach Gform item named g in the Gform Array named formTab
  // : doit être lu comme in
  for(Gform g : formTab ) { // équivalent à => foreach Gform item named g in the Gform Array named formTab
    g.draw();                   // dessine la forme g
    fill(defaultFillColor);     // rétablit les couleurs par défaut
    stroke(defaultStrokeColor); // rétablit les couleurs par défaut
    }
    
  // ajouter la ligne pour dessiner la forme a


}
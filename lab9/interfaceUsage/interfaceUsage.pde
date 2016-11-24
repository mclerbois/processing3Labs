
/*
  La notion d'interface en Java

  Supposons que l'on désire dessiner des formes géométriques différents à l'écran sans vraiment savoir ce que l'on dessine
  
  on crée un interface nommé gFrom qui décrit les proprités et méthodes indispensable des formes géométriques que nous dessinerons
  
  1) lire le fichier (onglet) Gform qui déclare l'interface  (répondre aux questions)
  2) lire le fichier (onglet) Rectangle                      (répondre aux questions)
  3) lire le fichier (onglet) Square                         (répondre aux questions)
  4) comparer les propriétés et méthodes de Rectangle et Square (répondre aux questions)
  4) executer le programme et lire le code ci-dessous (répondre aux questions)
  
  méthodes            Rectangle        Square
  constructeur        différent        différent
  draw                différent        différent
  getId               identique        identique
  getSurface          différent        différent (mais les méthodes pourraient devenir identiques après quelques modifications)
  className           identique        identique
  getCenter           ---------         existe     n'est pas une méthode proposée dans l'interface.
  
  5) lire le fichier (onglet) pourinformation
*/

// Déclaration et affectation d'un tableau de forme géométrique
// la dimension du tableau et son contenu sont définit durant l'affectation formTab={...};
Gform[] formTab = {                      // un tableau de formes géométriques
  new Rectangle(10,10,100,50),           // une première forme, un rectangle
  new Square(10,70,20)                   // une deuxième et dernière forme, un carré
  };                                     // utilisable

// Quelles sont les méthodes utilisables par formTab[0] : supprimer ci-dessous les méthodes non utilisables
// constructeur - draw - getId - getSurface - className - getCenter

// Quelles sont les méthodes utilisables par formTab[1] : supprimer ci-dessous les méthodes non utilisables
// constructeur - draw - getId - getSurface - className - getCenter

// forçace de type (typeName)varName , (Square)formTab[1] , formTab[1] est vu comme une objet de la classe Square et non plus Gform
// Quelles sont les méthodes utilisables par (Square)formTab[1] : supprimer ci-dessous les méthodes non utilisables
// constructeur - draw - getId - getSurface - className - getCenter


// je peut déclarer une variable avec le type Gform, mais il faudra l'affecter avec ...
Gform a=new Rectangle(0,0,10,10); // affectation avec une objet de la classe Rectangle, utilisable
Gform b; // non affectée, dont non utilisable

/**********************************************************************************************/
// procédure exécutée une seule fois
void setup(){
  
  // retiter les commentaires de la ligne ci-dessous, que constatez-vous.
  //print("Le centre de a=");println(((Square)a).getCenter()); // a est un rectangle ??? 
  
  // retiter les commentaires de la ligne ci-dessous, que constatez-vous.
  // b=new Gform();           // affectation avec une objet de la classe Gform ! (Il me semble que la classe Gform n'existe pas!)
   
  
  size(300,300); // dimension de la fenêtre affichée
  
  // affichage de caractéristique accessible des formes géométriques
  // foreach Gform item named g in the Gform Array named formTab
  // : doit être lu comme in
  
  for(Gform g : formTab ) {  // équivalent à => foreach Gform item named g in the Gform Array named formTab
    
    // retirer le commentaire de la ligne ci-dessous, que constater vous
    //g.id=7;
    
    print("Id is ");println(g.getId());
    print("Surface is ");println(g.getSurface());
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
    g.draw();               // dessine la forme g
    }
    
  // ajouter la ligne pour dessiner la forme a


  // peut ajouter ci-dessous b.draw() ? Retirer les commentaires
  // b.draw();
}
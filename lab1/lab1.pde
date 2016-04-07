
/*  Premier exemple de programme
*  M. Clerbois 
*  4 novembre 2015
*  Rev 1.0
*  Rev 1.1 avril 2016
*/

/* Déclaration de constantes
* final : mot clé pour définir que la variable sera non modifiable
* color et int, type de variables
*/

// on déclare une variable nommée jaune du type color avec l'attribut final 
// on affecte la variable jaune avec une constante correspondant à la couleur jaune.
final color jaune=color(255,255,0);               // Red=255 Green=255 BLUE=0
// on définit la couleur de fond de la fenêtre du programme
final color myBackGroundColor=color(99,161,215);

final int   myTextSize=32; // on définit la taille du texte 

// procédure appellée une fois au démarrage du programme
void setup()
{
  size(100,80);                   // la dimension de la fenêtre doit être définie par des valeurs numériques (pas de nom de variables)
  background(myBackGroundColor);  // couleur d'arrière plan de la fenêtre.
  textSize(myTextSize);           // On définit la taille du texte
  fill(jaune);                    // couleur utilisée pour écrire le texte
  println("Setup done");          // message affiché dans la console
}

// procédure appellée dans la boucle principale (cachée) du programme
void draw()
{
  text("Hello",10,50);           // affichage du texte dans la fenêtre graphique
}
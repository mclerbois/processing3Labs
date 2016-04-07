
/*
*  Deuxième exemple de programme
*  M. Clerbois 
*  4 novembre 2015
*  Rev 1.0
*/

/* Déclaration de constantes
* final : mot clé pour définir que la variable sera non modifiable
* color et int, type de variable
*/

final color jaune=color(255,255,0);               // Red=255 Green=255 BLUE=0
final color rouge=color(255,0,0);                 // Red=255 Green=0 BLUE=0
final color myBackGroundColor=color(99,161,215);

final int windowWidth=400;      // deux variables pour la dimension de la fenêtre
final int windowHeight=200;

final int   myTextSize=32;

// procédure appellée une fois avant setup, utilisée pour définir la taille de la fenêtre
// ajouté à la version 3 de processing
void settings()
{
  size(windowWidth,windowHeight); // la dimension de la fenêtre doit être définie par des valeurs numériques ou des variables
}

// procédure appellée une fois au démarrage du programme
void setup()
{
  println("Setup done");          // message affiché dans la console
}

// variable globale
int drawCount=0;

// procédure appellée dans la boucle principale (cachée) du programme
void draw()
{
  background(myBackGroundColor); // couleur d'arrière plan de la fenêtre, efface l'ancienne image.
  textSize(myTextSize);          // On définit la taille du texte
  fill(jaune);                   // couleur utilisée pour écrire le texte
  text("Hello",10,50);           // affichage du texte dans la fenêtre graphique
  textSize(myTextSize*2);        // On définit la taille du texte
  fill(rouge);                   // couleur utilisée pour écrire le texte
  text(drawCount++,10,150);      // affichage du texte dans la fenêtre graphique
}
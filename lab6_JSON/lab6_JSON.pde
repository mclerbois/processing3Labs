// Dessiner une image
// Les fichiers images aux formats PNG se trouve dans le dossier data.
// Le fichier de définition au format JSON se trouve dans le dossier data (defs.json)

/* Contenu du fichier defs.json, il contient des valeurs qui ne sont plus stockée dans le code du programme

{
  "backGroundColor" : 200,
  "LedA": {
    "x": 250, "y": 100,
    "offImage": "ledGreenOff8.png",
    "onImage": "ledGreenOn8.png"
  },
  "LedB": {
    "x": 280, "y": 100,
    "offImage": "ledGreenOff8.png",
    "onImage": "ledGreenOn8.png"
  },
  "swA": {
    "x": 10, "y": 10,
    "offImage": "swOff.png",
    "onImage": "swOn.png"
  },
  "swB": {
    "x": 110, "y": 10,
    "offImage": "swOff.png",
    "onImage": "swOn.png"
  }
}

  on peut donc modifier la couleur de fond, la position et le fichier image de chaque objet sans changer le code
  Le programme pourrait également modifier ce fichier defs dans le cas où on prévoit une fonction de configuration
  choix des images, de la position ...
  
  format JSON : 
    https://fr.wikipedia.org/wiki/JavaScript_Object_Notation
    http://www.w3schools.com/js/js_json_intro.asp
  
  Edition et validation de fichiers au format JSON : http://www.cleancss.com/json-editor/ 
*/

ledClass greenLedA,greenLedB;
switchClass swA,swB;

JSONObject  defs;
color backGroundColor;

// fonction exécutée une fois
// initialisation des variables +  ...
void setup(){
  size(400,400); // dimension de la fenêtre
  defs=loadJSONObject("defs.json"); // lire le fichier de définition
  
  backGroundColor=defs.getInt("backGroundColor");
  
  greenLedA=new ledClass(defs.getJSONObject("LedA"));
  greenLedB=new ledClass(defs.getJSONObject("LedB"));
  
  swA= new switchClass(defs.getJSONObject("swA"));
  swB= new switchClass(defs.getJSONObject("swB"));
  
  // indique à processing que la fonction pre (ci-dessous) devra être exécutée juste avant chaque draw
  // remplace la méthode pre (vide) contenue dans la librairie de processing par notre méthode.
  // https://github.com/processing/processing/wiki/Library-Basics
  registerMethod("pre", this);
}

// fonction exécutée dans une boucle
// dessin de l'écran
void draw(){
  background(backGroundColor); // couleur du fond de la fenêtre
  swA.draw();
  swB.draw(); 
  greenLedA.draw();
  greenLedB.draw();
  
}

// Exécuter avant draw, cette fonction doit être nommée pre
void pre() {
  // logiques equations
  greenLedA.change(swA.state() && swB.state());
  greenLedB.change(swA.state() || swB.state());
}

void mouseClicked()
{
  if (swA.OnMouseClicked()) return;
  swB.OnMouseClicked();
}
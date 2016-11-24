/*

  on peut déclarer plusieurs interface et créer des objets qui implémente plusieurs interfaces. 

*/

/**********************************************************************************************/
// des interfaces
interface marchant{
  void marcher();  // méthode propre aux insectes qui marche
}

interface sautant{
  void sauter();  // méthode propre aux insectes santant
}

interface volant{
  void voler();  // méthode propre aux insectes volant
}

/**********************************************************************************************/

// des objets implantant un ou plusieurs interfaces
class bug implements marchant {
  void marcher(){println("Je marche rapidement");};
}

class puce implements marchant, sautant {
  void marcher(){println("Je marche lentement");};
  void sauter(){println("Je saute");};
}

class coccinelle implements marchant, volant {
  void marcher(){println("Je marche lentement");};
  void voler() {println("Je ne vole pas vite");};
}

/**********************************************************************************************/
// Je déclare le tableau ci-dessous
marchant[] ceux_qui_marche;
// supprimer les noms de classes ci-dessous dont les objets créés ne peuvent faire partie du tableau
// bug -  puce - coccinelle

// Je déclare le tableau ci-dessous
sautant[] ceux_qui_saute;
// supprimer les noms de classes ci-dessous dont les objets créés ne peuvent faire partie du tableau
// bug -  puce - coccinelle

// Je déclare le tableau ci-dessous
volant[] ceux_qui_vole;
// supprimer les noms de classes ci-dessous dont les objets créés ne peuvent faire partie du tableau
// bug -  puce - coccinelle

/**********************************************************************************************/
// Que peut afficher la ligne ci-dessous
// println(ceux_qui_marche[i].getClass().getSimpleName();
// bug -  puce - coccinelle

// Que peut afficher la ligne ci-dessous
// println(ceux_qui_saute[i].getClass().getSimpleName();
// bug -  puce - coccinelle

// Que peut afficher la ligne ci-dessous
// println(ceux_qui_vole[i].getClass().getSimpleName();
// bug -  puce - coccinelle


// Cette notion d'interface n'existe pas en C++
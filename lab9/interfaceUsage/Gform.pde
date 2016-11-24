/*

  La notion d'interface en Java

  Supposons que l'on désire dessiner des formes géométriques différents à l'écran sans vraiment savoir ce que l'on dessine
  
  on crée un interface nommé gFrom qui décrit les proprités et méthodes des formes géométriques que nous dessinerons
  
  Les propriétés (variables) seront toujours des constantes
  Les méthodes devront être prévues pour chaque implémentation de nouvelles classes d'objets.
  
  On peut dire que les class d'objets implémentant l'interface peuvent avoir accès aux constantes déclarées dans l'interface
  et doivent déclarer les méthodes décrites dans l'interface.
  
*/

// déclaration de l'interface
interface Gform {
  int id=1;           // constante commune à chaque implémentation, toutes variables déclarées dans l'interface est une constante.
  void draw();        // méthode dont devra disposer chaque implémentation, dessine la forme géométrique
  int getId();        // méthode dont devra disposer chaque implémentation, fournit la valeur de l'identifiant
  int getSurface();   // méthode dont devra disposer chaque implémentation, calcule la surface de la forme géométrique
  String className(); // méthode dont devra disposer chaque implémentation, fournit le nom de la classe utilisée pour l'implémentation
}
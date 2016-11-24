
// url des serveurs web
// localhost, c'est votre PC
final String urla="http://localhost";
final String urlb="http://localhost:8080";

// url plus complexe non encore implémenté et testé
// le mot clé alarms indique une opération sur des éléments du serveur nommé alarmes
// le mot clé state indique que l'on désire l'état des alarmes
// le serveur doit décoder l'url pour répondre à la demande
// final String ulrc="http://localhost/alarms/state
//
// autre exemple, acquittement d'une alarme (la n°23)
// final String ulrc="http://localhost/alarms/acquit/23

// si programme serveur fonctionne sur un autre PC alors définir ci-dessous l'adress ip de cette machine
//final String urla="http://192.168.0.4";
//final String urlb="http://192.168.0.4:8080";


void setup(){
  println("Données reçues au format JSON");
  JSONObject data=loadJSONObject(urla); // charger des données au format json fournies par le serveur
  println(data.toString()); // afficher ces données
  
  println("Données reçues au format texte");
  println(loadStrings(urlb)); // charger des données au format texte fournie par un second serveur
  
  // fin du programme
  noLoop();
  exit();
}
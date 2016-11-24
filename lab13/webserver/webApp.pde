/*
  Version en cours de développement d'un objet de gestion d'application web
*/

// classe abstraite
public abstract class httpApp extends Object {
  public String myIp;
  public String doGet() {
    return "hello";        // valeur fournie par défaut lors d'un accès à un serveur web
  }
}

// classe de gestion de d'une connexion, on fournit des données au format JSON
// JSON https://fr.wikipedia.org/wiki/JavaScript_Object_Notation

public class jsonApp extends httpApp {
  public String myIp;
  
  public String doGet() {
    JSONObject datas=new JSONObject();        // on crée un objet JSON vide
    datas.setString("id", "RemoteDevice");    // on lui ajoute des éléments texte (string) et des nombres (int)
    datas.setString("name", "PC");
    datas.setInt("day", day());
    datas.setInt("month", month());
    datas.setInt("year", year());
    datas.setInt("hour", hour());
    datas.setInt("minute", minute());
    datas.setInt("second", second());
    datas.setString("Ip",myIp);
    return datas.toString();                 // on fournit un chaîne de caractère (phrase) contenant les données
  }
}


public class htmlApp extends httpApp {

  public String doGet() {
    // on retourne une chaîne contenant le code HTML d'une page WEB.
    // HTML https://fr.wikipedia.org/wiki/Hypertext_Markup_Language
    return "<html><head></head><body><h1>Hello</h1></body></html>";
  }
}
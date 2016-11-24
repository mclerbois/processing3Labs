/*
  Version en cours de développement d'un objet de gestion de client web
  
  Ne pas lire le code pour l'instant

*/

import processing.net.*;

import java.util.Map;
import java.util.Iterator;
import java.util.Set;


//=======================================================================
//=======================================================================
class httpClient {
  
  final private static String HTTP_HEADER = "HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n";

  Client client;
  int index;
  String  cmd;
  String  target;
  PApplet parent;

  /************************************************************************/
  httpClient(PApplet parent,Client client){
    this.client=client;
    this.parent=parent;
    index=0;
    }
  
  
  /************************************************************************/
  boolean get(){
    if (client.available()==0)
      return false;
    String line=client.readStringUntil('\n');
    if (index++==0) {
      String[] tk =parent.splitTokens(line, " :");
      cmd=tk[0];
      target=tk[1];
      return false;
      }
    return (line.length()<3);

        //process();
        //client.stop();
    }

  /************************************************************************/
  void sendHtml(String[] lines){
    client.write(HTTP_HEADER);
    for (int l=0;l<lines.length;l++)
      client.write(lines[l]);
    client.write("\n");
  }
  
  /************************************************************************/
  void sendHtml(String line){
    client.write(HTTP_HEADER); 
    client.write(line);
    client.write("\n");
  }
    
  public void close(){
    client.stop();
    }
    
}
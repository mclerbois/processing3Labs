/*
  Version en cours de développement d'un objet de gestion d'un serveur web
  
  Ne pas lire le code pour l'instant

*/
import java.util.Map;
import java.util.Iterator;
import java.util.Set;
import java.util.HashMap;
import processing.net.*;


//String HTTP_GET_REQUEST = "GET /";

class httpServer extends Server {
 
  private  HashMap<String,httpClient> httpClientList;// = new HashMap<String,httpClient>();
  
  private  PApplet parent;
  private  httpApp app;
  
//=======================================================================
 public httpServer(PApplet parent, int port,httpApp app){
    super(parent,port);
    this.parent=parent;
    httpClientList = new HashMap<String,httpClient>();
    this.app=app;
    }
  
  //=======================================================================
void  createClient(Client aclient) {
  String hashCode=Integer.toString(aclient.hashCode());
  if (!httpClientList.containsKey(hashCode))
    httpClientList.put(hashCode,new httpClient(parent,aclient));
  //parent.println(httpClientList.size());
  }

//=======================================================================
boolean removeClient(Client aclient){
  String hashCode=Integer.toString(aclient.hashCode());
  if (httpClientList.containsKey(hashCode)){
    httpClientList.remove(hashCode);
    aclient.dispose();
    return true;
    }
  return false;
  }
  
  
//=======================================================================
public void  process(){
    for (Map.Entry aHttpClient : httpClientList.entrySet())
      if (httpClientList.get(aHttpClient.getKey()).get()) {
        if (httpClientList.get(aHttpClient.getKey()).cmd.equals("GET")){
          doGet(httpClientList.get(aHttpClient.getKey()));
          httpClientList.get(aHttpClient.getKey()).close();
          return;
          }
      if (httpClientList.get(aHttpClient.getKey()).cmd.equals("POST")){
          doPost(httpClientList.get(aHttpClient.getKey()));
          httpClientList.get(aHttpClient.getKey()).close();
          return;
          }        
        }
  }
  
  
//=======================================================================
private void doGet(httpClient client){
  client.sendHtml(app.doGet());
  }
  
  
//=======================================================================
private void doPost(httpClient client){
  
  }
  
  

}
/*
  Version en cours de développement d'un objet de gestion d'une liste de serveurs web
  
  Ne pas lire le code pour l'instant

*/

class httpServerList implements Runnable {

  private  HashMap<Integer, httpServer> httpServers;// = new HashMap<String,httpServer>();


  public httpServerList() {
    httpServers= new HashMap<Integer, httpServer>();
  }

  public void add(PApplet parent, int port, httpApp app) {
    httpServers.put(app.hashCode(), new httpServer(parent, port, app));
  }  

  public void removeClient(Client aclient) {
    for (Map.Entry aHttpServer : httpServers.entrySet())
      if (httpServers.get(aHttpServer.getKey()).removeClient(aclient))
        return;
  }

  public void process() {
    for (Map.Entry aHttpServer : httpServers.entrySet())
      httpServers.get(aHttpServer.getKey()).process();
  }

  public void run() {
    for (;; ) {
      process();
      try { 
        java.lang.Thread.sleep(100);
      }
      catch (Exception e) {
        System.out.println(e);
      }
    }
  }
}


void serverEvent(Server aServer,Client aclient) {
  println("Server Event");
  ((httpServer)aServer).createClient(aclient);
}

void disconnectEvent(Client aclient) {
  println("Disconnect Event");
  webServers.removeClient(aclient);
}
import processing.net.*;

// liste de serveur web fonctionnant sur ce PC
// httpServerList est un objet RUNNABLE - https://openclassrooms.com/courses/apprenez-a-programmer-en-java/executer-des-taches-simultanement
// THREAD https://fr.wikipedia.org/wiki/Thread_(informatique)
httpServerList  webServers;


void setup(){
    // création d'une nouvelle tâche à partir d'un objet httpServerList gérant un ou plusieurs serveur web sur le pc
    Thread webApp = new Thread(webServers=new httpServerList());   
    // ajout d'un premier serveur utilisant le port 80 et l'application jsonApp pour répondre au message GET
    webServers.add(this,80,new jsonApp()); 
    // ajout d'un second serveur utilisant le port 80808 et l'application htmlApp pour répondre au message GET
    webServers.add(this,8080,new htmlApp()); 
    // démarrage de la tâche de gestion des serveurs et de leurs clients
    webApp.start();
}

void draw(){
    if ((frameCount&30)==0)
      background(color(random(0,255),random(0,255),random(0,255)));
  }
  
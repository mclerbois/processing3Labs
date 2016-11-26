Exemple d'objet simulant le fonctionnement d'une diode led

- constructeur
  public <b>ledClass</b>(String ledOffFile, String ledOnFile) {... }
  
- fonction de dessin
  public void <b>draw</b>(int x,int y){...}
  
- fonction pour allumer la diode led
  public void <b>on</b>() {...}
    
- fonction pour éteindre la diode led
  public void <b>off</b>() {...}
  
- fonction pour changer l'état de la diode led
  public void <b>toggle</b>() {...}
    
- fonction pour changer l'état la diode led
  public void <b>change</b>(boolean newState) {...}
    
- fonction pour lire l'état de la diode
  public boolean <b>state</b>() {...}

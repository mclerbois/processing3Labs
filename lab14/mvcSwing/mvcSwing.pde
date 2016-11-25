/*
    MVC
    
    MODEL - VIEW - CONTROLER
    
    MODEL       => les données
    VIEW        => ce que l'utilisateur voit 
    CONTROLER   => gère les communications et l'application
    
    https://openclassrooms.com/courses/apprenez-a-programmer-en-java/mieux-structurer-son-code-le-pattern-mvc

    1) Lire le code ci-dessous.
    2) Lire le code de l'onglet abstractModel
    3) Lire le code de l'onglet myModel
    4) Lire le code de l'onglet abstractControler
    5) Lire l'onglet myControler
    6) Lire l'onglet swingvue
    
*/

simpleVue myVue;

void setup(){    
    // Création de l'objet gérant le modèle, un tableau de 16 valeurs logiques
    AbstractModel model = new myModel();
    
    //Création du contrôleur, gérant le modèle
    //par exemple des fonctions logiques entre les valeurs logiques
    // on passe notre modèle en paramètre
    AbstractControler controler = new myControler(model);
    
    //Création de notre fenêtre avec le contrôleur en paramètre
    myVue=new simpleVue("Fenêtre swing",controler); 
    myVue.setLocation(200,200);
    
    //Ajout de la fenêtre comme observer de notre modèle
    model.addObserver(myVue);
    noLoop();
}
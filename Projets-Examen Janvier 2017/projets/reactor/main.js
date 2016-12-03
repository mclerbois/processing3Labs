/*
    path: ./laboinfo2012/prj/ex3/main.js
    M. Clerbois 25-nov-2012
    Git: $Id$ 
    GitBranch : origin/master
	
*/

    
function main() {
    var unloaded={count : 0};
    putsAt("title",_project.title);
    putsAt("auteur",_project.auteur);
  
    _project.loadImages(unloaded);

    // attendre que toutes les images soient chargées et appeller la suite du programme
    waitAllImagesLoaded(_main, unloaded);
    };


function _main() {
    _project.run();
    }


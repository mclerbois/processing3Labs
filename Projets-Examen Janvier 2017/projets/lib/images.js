/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


// fonction de chargement d'images
function loadImage(filename,unloaded){
    unloaded.count++;
    var img=new Image();    // on crée un objet dy type image
    img.src=filename;       // on spécifie le nom du fichier
    img.unloaded=unloaded;
    img.onload=function(){  // on définit ce qu'il faut faire lorsqu'elle est chargée
        this.unloaded.count--; // il y a une image en moins à charger
        };
    return img;             // on fournit l'objet image à l'élément qui l'a créé
                            // même si l'image n'est pas encore chargée.
    }

function waitAllImagesLoaded(whatToDoAfter,unloaded,params){
    if (unloaded.count==0)
        whatToDoAfter(params);
    else
        setTimeout(function () { 
            waitAllImagesLoaded(whatToDoAfter,unloaded,params);
            },10);
    }

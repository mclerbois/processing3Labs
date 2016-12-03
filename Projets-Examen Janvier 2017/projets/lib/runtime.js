/*  
    path: ./laboinfo2012/prj/ex3/lib/runtime.js
    M. Clerbois 14-Oct-2012
    Git: $Id$ 
    GitBranch : origin/master 
*/

jQuery.noConflict(); // prototype.js

// Exéution automatique de la fonction main lorsque la page est chargÃ©e
jQuery(document).ready(function () {
    main();
    });
		
/*
 * procedure print(format [, args ])
 * les args sont optionnels
 *  %v pour définir l'emplacement de la valeur numÃ©rique
 */ 

function _print(tag,s) {
    var n=arguments.length;
    for (var i=2;i<n;i++) {
        var s=s.replace(/\%v/i, '<span class="number">' + arguments[i] + '</span>');
        }
    puts("<"+tag+">"+s+"</"+tag+">");
    }

function print(s) {
    var n=arguments.length;
    for (var i=1;i<n;i++) {
        var s=s.replace(/\%v/i, '<span class="number">' + arguments[i] + '</span>');
        }
    puts("<p>"+s+"</p>");
    }
	
/*
 * Ajoute à  la section d'ID="main" le texte s
 */

function puts(s) {
    jQuery("#main").append(s);
    }
	

function isReal(s){
    return (s.search(/^[\s\t]*[\+\-]?[0-9]*[\.]?[0-9]*[Ee]?[+-]?[0-9]+/i)!=-1);
    }

function lireRealValue(msg,defaultValue){
    var s=prompt(msg,defaultValue);
    if (isReal(s)) {
        return parseFloat(s);
    }
    else {
        alert("Valeur erronÃ©e << "+s+" >>");
        return 0;
        }
}

function printAt(id,s) {
    var n=arguments.length;
    for (var i=2;i<n;i++) {
        s=s.replace(/\%v/i, '<span class="number">' + arguments[i] + '</span>');
    }
    putsAt(id,"<p>"+s+"</p>");
}
	
function putsAt(id,s) {
    jQuery("#"+id).html(s);
}

function setFormElements(form,values){
    for (var i=0;i<values.length && i<form.elements.length;i++)
        document.forms[form.name].elements[form.elements[i]].value=values[i];
}


function getFloat(form,element) {
    var s=document.forms[form.name].elements[form.elements[element]].value;
    if (isReal(s))
        return parseFloat(s);
    else {
        alert("Valeur erronée << "+s+" >>");
        return 0;
        }
}

function getArguments(){
    var args = new Object();
    args.str = document.location.search.substring(1).split('&');
    for (var i=0;i<args.str.length;i++) {
        var arg= args.str[i].split('=');
        if (arg.length>1)
            args[arg[0]]=arg[1];
        }   
    return args;
    }

function objMerge(a,b) {
    var obj={};
    objCopy(a,obj);
    objCopy(b,obj);
    return obj;
    }

function objCopy(src,dest){
    if (src!=null && dest!=null)
        for (var elem in src)
            dest[elem]=src[elem];
    }
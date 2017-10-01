FUNCIONES = {};
FUNCIONES.desarrollar= function(elSelector){
    var xhr = new XMLHttpRequest();
    var i = elSelector ;
    var respuesta;

    xhr.open("GET","./PubServer");  
    xhr.onreadystatechange = function(){
        
        if(xhr.readyState === 4 ) {
            if (xhr.status === 200) { 
                
                respuesta = '{"notas":' + xhr.responseText + '}';
                obj = JSON.parse(respuesta);
                
                var titppal = "#tit_" + elSelector;
                var panelito = document.querySelector(titppal);
                panelito.innerHTML =  obj.notas[i].titulo;
                
                var cop = "#cop_" + elSelector;
                var panelito = document.querySelector(cop);
                panelito.innerHTML = obj.notas[i].copete;

                var tex = "#text_" + elSelector;
                var panelito = document.querySelector(tex);
                panelito.innerHTML = obj.notas[i].texto + "</br>" + " </br> "  + "<p align=right>"  
                        + "Autor: "+ "<b>"  + obj.notas[i].nombre + " " + obj.notas[i].apellido  +  "</b>" + "</p>";     
                }
            }
        };

        xhr.send();  
    };
    
FUNCIONES.iniciar = function () {

    var xhr = new XMLHttpRequest();
    
    var respuesta;

    xhr.open("GET","./PubServer");  
    xhr.onreadystatechange = function(){
        
        if(xhr.readyState === 4 ) {
            if (xhr.status === 200) { 
                
                respuesta = '{"notas":' + xhr.responseText + '}';
                obj = JSON.parse(respuesta);
                
                for (i=1 ; i < 9 ; i++){
               
                    var titppal = "#tit_" + i;
                    var panelito = document.querySelector(titppal);
                    panelito.innerHTML =  obj.notas[i].titulo;

         /*           var url_img= obj.notas[i].url;
                    url_img = '<img src="' + url_img + '"' + ' title="titulo"  width="320" height="240" alt="IMG-20160616-WA0037">';
                    alert( url_img);    

                    var foto = "#img_" + i;
                    panelito = document.querySelector(foto);
                    panelito.innerHTML = url_img;

         */
                    var cop = "#cop_" + i;
                    panelito = document.querySelector(cop);
                    panelito.innerHTML = obj.notas[i].copete; 

                
                
                 }
            }
        }
    };
    xhr.send();  
}; 
/*
"apellido":"Fuks",
"copete":"Perú rechaza jugar en la Bombonera debido al lamentable hecho del gas pimienta",
"fecha":"2017-09-06",
"id":"7",
"nombre":"Chavo",
"texto":"Lamentablemente el ... exigencias FIFA.",
"titulo":"Rechazo de Perú"
*/
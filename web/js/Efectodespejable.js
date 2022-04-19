  var lista=document.getElementById('dentro1');
    
      var lis=function(e){
         lista.classList.toggle('listo1');/*agrega clase*/
          var height=0;
          var menu =lista.nextElementSibling;/*seleciona su hermano ayacente*/
          console.log(menu.scrollHeight);/* ve el tamaño de menu*/
          if(menu.clientHeight=="0"){
             height=menu.scrollHeight; 
          };
          
          menu.style.height=height+"px";
      };
        
     lista.addEventListener('click',lis);



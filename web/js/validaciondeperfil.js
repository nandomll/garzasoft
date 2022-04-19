var formulario=document.getElementById('fomulario');
var clave=document.getElementById('idclave');
var claveantigua=document.getElementById('idclaveantigua');
var clavenueva=document.getElementById('idclavenueva');
var clavenuevar=document.getElementById('idclavenuevar');


var validarclaveantiguo=function(e){
    if( claveantigua.value==clave.value)
    {
       document.getElementById('no_valido').classList.add('invalid-feedback');  
       document.getElementById('idclaveantigua').classList.remove('border-danger');
    }else{
      document.getElementById('no_valido').classList.remove('invalid-feedback');
      document.getElementById('idclaveantigua').classList.add('border-danger');
    }
};
claveantigua.addEventListener('keyup', validarclaveantiguo);
claveantigua.addEventListener('blur', validarclaveantiguo);



var validarclavenueva=function(e){
        if( clavenuevar.value==clavenueva.value)
    {
       document.getElementById('no_valido1').classList.add('invalid-feedback');  
       document.getElementById('idclavenueva').classList.remove('border-danger');
       document.getElementById('no_valido2').classList.add('invalid-feedback');  
       document.getElementById('idclavenuevar').classList.remove('border-danger');
    }else{
      document.getElementById('no_valido1').classList.remove('invalid-feedback');
      document.getElementById('idclavenueva').classList.add('border-danger');
      document.getElementById('no_valido2').classList.remove('invalid-feedback');
      document.getElementById('idclavenuevar').classList.add('border-danger');
    }   ; 
};


clavenueva.addEventListener('keyup',validarclavenueva );
clavenueva.addEventListener('blur', validarclavenueva);

var validarclavenuevar=function(e){
      if( clavenueva.value==clavenuevar.value)
    {
        document.getElementById('no_valido1').classList.add('invalid-feedback');  
       document.getElementById('idclavenueva').classList.remove('border-danger');
       document.getElementById('no_valido2').classList.add('invalid-feedback');  
       document.getElementById('idclavenuevar').classList.remove('border-danger');
    }else{
     document.getElementById('no_valido1').classList.remove('invalid-feedback');
      document.getElementById('idclavenueva').classList.add('border-danger');
      document.getElementById('no_valido2').classList.remove('invalid-feedback');
      document.getElementById('idclavenuevar').classList.add('border-danger');
    }    
};


clavenuevar.addEventListener('keyup',validarclavenuevar );
clavenuevar.addEventListener('blur', validarclavenuevar);
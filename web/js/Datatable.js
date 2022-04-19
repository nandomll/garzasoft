 $(document).ready(function() {
            $('#datatable').DataTable( {
               "ordering": false,
                "language": {
                    "lengthMenu": "Mostrar _MENU_ Registros por paginas",
                    "zeroRecords": "Nada encontrado - disculpa",
                    "info": "Mostrando la pagina _PAGE_ de _PAGES_",
                    "infoEmpty": "No hay datos a mostrar",
                    "infoFiltered": "(Filtrado de _MAX_ Registros Totales)",
                    "search":"Buscar:",
                    "paginate":{
                        "next":"Siguiente",
                        "previous":"Anterior"
                    }
                    
                }
               
            } );
        } );



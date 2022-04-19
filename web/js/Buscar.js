 $(document).ready(function(){
          $(".buscarjs").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $(".tablejs tr").filter(function() {
              $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
          });
        });

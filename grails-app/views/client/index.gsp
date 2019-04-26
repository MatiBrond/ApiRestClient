<%--
  Created by IntelliJ IDEA.
  User: mbrond
  Date: 2019-04-26
  Time: 09:32
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <g:javascript library='jquery' plugin='jquery' />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <title>Client Controller Index</title>

    <title></title>
</head>

<body>
%{--
<g:select optionKey="id" optionValue="name"
          name="sites" from="${result}"
          action="getP" onchange="callAjax(this.value);"
          noSelection="['null':'Seleccione país']">
</g:select>


<g:select id="met" optionKey="id" optionValue="name"
          name="getP" from="${re}"
          action=""
          noSelection="['null':'Seleccione método de pago']">
</g:select>
--}%

%{--<g:select id="orden" optionKey="id" optionValue="name"
           name="orden" action="" onChange="" from=""
          noSelection="['null':'Seleccione criterio de orden']">
</g:select>--}%


<form class="needs-validation" name="form" novalidate>
    <div class="form-row">

        <div class="col-md-4 mb-3 md-form">
            <label for="site">Site</label>

            <g:select optionKey="id" optionValue="name"
                      name="site_id" from="${result}" id="site"
                      onchange="callAjax(this.value);"
                      noSelection="['null':'Seleccione país']"
                      class="custom-select browser-default" required="true">
            </g:select>

        </div>
        <div class="col-md-4 mb-3 md-form">
            <g:select id="met" optionKey="id" optionValue="name"
                      name="payment_method_id" from="${re}"

                      noSelection="['null':'Seleccione método de pago']"
                      class="custom-select browser-default">
            </g:select>
        </div>
        <div class="col-md-4 mb-3 md-form">
            <label for="near_to">Near to</label>
            <input type="text" class="form-control" id="near_to" name="near_to" placeholder="Near to" value=""
                   required>
        </div>
        <div class="col-md-4 mb-3 md-form">
            <label for="near_to">Limite</label>
            <input type="text" class="form-control" id="limit" name="limit" placeholder="Limit" value=""
                   required>
        </div>
        <div class="col-md-4 mb-3 md-form">
            <label for="offset">Offset</label>
            <input type="text" class="form-control" id="offset" name="offset" placeholder="Offset" value=""
                   required>
        </div>

%{--        <div class="col-md-4 mb-3 md-form">
            <label for="orden">Orden</label>

            <g:select id="orden" optionKey="id" optionValue="name"
                      name="orden" action="" onChange="" from=""
                      noSelection="['null':'Seleccione criterio de orden']">
            </g:select>

        </div>--}%

    </div>

</form>
<button class="btn btn-primary btn-sm btn-rounded"
        onclick="callAjax2()">Submit
</button>



<script type="text/javascript">

    function callAjax(id){
        var URL= "https://api.mercadolibre.com/sites/" + id + "/payment_methods/"
        $.ajax({
            url:URL,
            method: "GET",
            success: function(response){
                console.log(response)
                    $('#met').empty();
                $.each(response, function (i, it) {
                    $('#met').append($('<option>', {
                        value: it.id,
                        text : it.name
                    }));
                });
            }
        });}


/*
    function showValues() {
        var fields = $( ":input" ).serializeArray();
        $( "#results" ).empty();
        jQuery.each( fields, function( i, field ) {
            $( "#results" ).append( field.value + " " );
        });
    }
*/

        function callAjax2(){

            var data = $("form").serializeArray();
            console.log(data);

            var URL="/client/getP/"

   /*         $.ajax({
                url:URL,
                method: "GET",
                data: data,
                success: function(response){

                    console.log(response)

                }
            })*/;}


/*    (function() {
        'use strict';
        window.addEventListener('load', function() {
// Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
// Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();*/




</script>


</body>
</html>
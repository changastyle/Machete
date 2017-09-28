app = angular.module('app', []);

app.controller('controlRemoto', function($scope, $rootScope) 
{
    $scope.arrFotos = [];
    $scope.init = function()
    {
        $scope.findFotos()
    }
    $scope.findFotos = function()
    {
        $.ajax(
        {
            url:"../../findUltimasFotos",
            beforeSend: function (xhr) 
            {
                $("#loading").show();
            },
            success: function (resultado, textStatus, jqXHR)
            {
                console.log("res find fotos: " + JSON.stringify(resultado));
                $scope.arrFotos = resultado;
                $scope.$apply();
                $("#loading").hide();
            }
        });
    }
    $scope.refrescarFotos = function()
    {
        $scope.findFotos();
    }
    $scope.tomarFoto = function()
    {
        $.ajax(
        {
            url:"../../quieroScreenshot",
            beforeSend: function (xhr) 
            {
                $("#loading").show();
                $scope.cargandoFotos = true;
            },
            success: function (resultado, textStatus, jqXHR) {
                console.log("res tomar Foto: " + resultado);
                
                if(resultado)
                {
//                    $scope.refrescarFotos();
                    $("#loading").hide();
                }
                /*
                setTimeout(function()
                {
                    $scope.refrescarFotos();
                },1500);*/
            }
        });
    }
    $scope.agrandarFoto = function(foto)
    {
        $("#img-maximo").attr("src",foto.url);
        $scope.fotoSeleccionada = foto;
        $scope.$evalAsync();
        $(".maximo").show();
    }
    $scope.cerrarFotoMaximo = function()
    {
        $("#img-maximo").attr("src","");
        $(".maximo").hide();
    }
});
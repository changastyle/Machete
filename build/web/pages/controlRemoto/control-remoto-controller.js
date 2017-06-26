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
            beforeSend: function (xhr) {
                $scope.cargandoFotos = true;
            },
            success: function (resultado, textStatus, jqXHR)
            {
                console.log("res find fotos: " + JSON.stringify(resultado));
                $scope.arrFotos = resultado;
                $scope.cargandoFotos = false;
                $scope.$apply();
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
            beforeSend: function (xhr) {

            },
            success: function (resultado, textStatus, jqXHR) {
                console.log("res tomar Foto: " + resultado);
                
                setTimeout(function()
                {
                    $scope.refrescarFotos();
                },1500);
            }
        });
    }
});
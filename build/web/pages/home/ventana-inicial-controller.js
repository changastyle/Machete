app = angular.module('app', []);

app.controller('machete', function($scope, $rootScope) 
{
    $scope.init = function()
    {
        $scope.findMaterias();
    }
    $scope.openModalMaterias = function()
    {
        console.log("abriendo modal materias");

        $("#modal-materias").modal();
    }
    $scope.addMateria = function()
    {
        console.log("agregando materia");

        $.ajax(
        {
            url:"../../addMateria",
            data:
            {
                "nombre":$scope.materia.nombre
            },
            success: function (resultado, textStatus, jqXHR)
            {
                console.log("res add materia: " + resultado);
            }
        });
    }
    $scope.findMaterias = function()
    {
        $.ajax(
        {
            url:"../../findMaterias",
            beforeSend: function (xhr) {
                $scope.cargandoMaterias = true;
            },
            success: function (resultado, textStatus, jqXHR) 
            {
                console.log("res find materias: " + JSON.stringify(resultado));

                $scope.arrMaterias = resultado;
                $scope.cargandoMaterias = false;
                $scope.$apply();
            }
        });
    }
    $scope.abrirMateria = function(materia)
    {
        console.log("abriendo materia " + JSON.stringify(materia));

        localStorage.setItem("materia",JSON.stringify(materia));
        window.location.href = "../preguntas/preguntas.jsp";

    }
    
    $scope.cambiarmeAControlRemoto = function()
    {
        window.location.href = "../controlRemoto/controlRemoto.jsp";
    }
});
app = angular.module('app', []);

app.controller('machete', function($scope, $rootScope) 
{

    $scope.arrPreguntas = [];
    $scope.modoEdicion = false;
    $scope.preguntaEditando;
    $scope.materia = null;

    $scope.init = function()
    {
        $scope.materia = JSON.parse(localStorage.getItem("materia"));
        console.log("materia: " + JSON.stringify($scope.materia));
        $scope.temaSeleccionado = $scope.materia.temasList[0];
        $scope.findPreguntas();
    }
    $scope.findPreguntas = function()
    {
        $.ajax(
        {
            url:"../../findPreguntas",
            data: 
            {
                "fkTema":$scope.temaSeleccionado.id
            },
            beforeSend: function (xhr) {
                $scope.cargandoPreguntas = true;
            },
            success: function (resultado, textStatus, jqXHR) 
            {
                $scope.arrPreguntas = resultado;
                $scope.cargandoPreguntas = false;
                $scope.$apply();
            }
        });
    }
    $scope.addPregunta = function()
    {
        $.ajax(
        {
            url:"../../addPregunta",
            data:
            {
                "pregunta":$scope.preguntaEditando.pregunta,
                "respuesta":$scope.preguntaEditando.respuesta,
                "fkTema":$scope.preguntaEditando.tema.id,
                "esImagen":$scope.preguntaEditando.esImagen
            },success: function (resultado, textStatus, jqXHR) 
            {
                if(resultado)
                {
                    $("#myModal").modal('hide');
                    $scope.preguntaEditando = null;
                    $scope.findPreguntas();
                }
            }
        });
    }
    $scope.editPregunta = function()
    {
        $.ajax(
        {
            url:"../../editPregunta",
            data:
            {
                "id":$scope.preguntaEditando.id,
                "pregunta":$scope.preguntaEditando.pregunta,
                "respuesta":$scope.preguntaEditando.respuesta,
                "fkTema":$scope.preguntaEditando.tema.id,
                "esImagen":$scope.preguntaEditando.esImagen
            },success: function (resultado, textStatus, jqXHR) 
            {
                console.log("res: " + resultado)
                if(resultado)
                {
                    $scope.salirModoEdicion();
                    $scope.preguntaEditando = null;
                    $scope.findPreguntas();
                }
            }
        });
    }
    $scope.rmPregunta = function(pregunta)
    {
        if(confirm("Seguro deseas borrar " + pregunta.pregunta + " ?"))
        {
            $.ajax(
            {
                url:"../../rmPregunta",
                data:
                {
                    "id":pregunta.id,
                },success: function (resultado, textStatus, jqXHR) 
                {
                    console.log("Res: " + resultado);
                    if(resultado)
                    {
                        $scope.findPreguntas();
                    }
                }
            });
        }
    }
    $scope.entrarModoEdicion = function(pregunta)
    {
        $scope.modoEdicion = true;
        $scope.preguntaEditando = pregunta;
        //$scope.preguntaEditando.tema = pregunta.tema.id;
        console.log("tema: " +  JSON.stringify(pregunta.tema));

        for(i = 0 ; i < $scope.materia.temasList.length ;i++)
        {
            if($scope.materia.temasList[i].id == pregunta.tema.id)
            {
                console.log("mismo id:" + pregunta.tema.id);
                $scope.preguntaEditando.tema = $scope.materia.temasList[i];
            }
        }

        $("#myModal").modal();
    }
    $scope.openModal = function()
    {
        $scope.modoEdicion = false;
        $scope.preguntaEditando = {"nombre":"","respuesta":"","tema":""}; 
        $scope.preguntaEditando.tema = $scope.materia.temasList[0];
        $("#myModal").modal();
    }
    $scope.openModalTema = function()
    {
        $scope.modoEdicion = false;
        $scope.preguntaEditando = null; 
        $("#modal-temas").modal();
    }
    $scope.salirModoEdicion = function()
    {
        $scope.modoEdicion = false;
        $scope.preguntaEditando = null; 
        $("#myModal").modal('hide');
    }
    $scope.limpiarBarraBusqueda = function()
    {
        $scope.busqueda = "";
    }
    $scope.open = function(url)
    {
        var win = window.open(url, '_blank');
        win.focus();
    }
    $scope.addTema = function()
    {
        console.log("add tema: " + JSON.stringify($scope.tema));
        $.ajax(
        {
            url:"../../addTema",
            data:
            {
                "fkMateria":$scope.materia.id,
                "nombre":$scope.tema.nombre
            },
            beforeSend: function (xhr) {

            },
            success: function (resultado, textStatus, jqXHR) 
            {
                console.log("resultado add tema: " + resultado)
            }
        });
    }
    $scope.cambioComboTemas = function()
    {
        console.log("cambio combo temas : " + JSON.stringify($scope.temaSeleccionado));
        $scope.findPreguntas();
    }
});
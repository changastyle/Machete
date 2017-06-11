<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../comun/head.jsp" %>
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
        <title>MACHETE</title>
        <style>
            *
            {
                font-family: 'Raleway', sans-serif;
            }
            body
            {
                background-color: #1abc9c;
            }
            .head-machete
            {
                text-align: center;
                background-color:white;
                margin-top:0px;
                padding:12px;
                margin-bottom:25px;
                
            }
            .contenedor-preguntas
            {
                background-color: white;
                padding:25px;
                margin-top:80px;
            }
            .listado-preguntas
            {
                padding-left:0px;
                padding-right: 0px;
            }
            .item-listado-preguntas
            {
                padding:12px;
                background-color:#1abc9c;
                border-radius: 6px;
                margin-top: 25px;
            }
            .question-pregunta
            {
                color: white;
                background-color:rgba(0,0,0,0.45);
                padding:12px;
                font-size: 22px;
            }
            .answer-pregunta
            {
                padding:12px;
                color: white;
                font-weight: bolder;
                font-size: 22px;
            }
            .boton-nueva-pregunta , .boton-nueva-pregunta:active , .boton-nueva-pregunta:focus , .boton-nueva-pregunta:hover
            {
                background-color:#1abc9c;
                color:white;
            }
        </style>
    </head>
    <body ng-app="app" ng-controller="machete" ng-init="init()"  ng-cloak>
        
        
        
        <div class="contenedor-preguntas col-xs-8 col-xs-offset-2">
            
            <h1 class="head-machete col-xs-12">Listado de Preguntas</h1>
            
            <div class="input-group">
                <input type="search" class="form-control" placeholder="Buscá tu pregunta rapidamente.." ng-model="busqueda">
                <span class="input-group-addon" id="basic-addon1" ng-click='limpiarBarraBusqueda()' style='cursor: pointer'>
                    <span class='glyphicon glyphicon-remove' ></span>
                </span>
            </div>
            
            <div class="col-xs-12" style="padding-left: 0px;padding-right: 0px;">
            <button type="button" class="btn boton-nueva-pregunta" ng-click="openModal()" style="margin-top:25px;">
                <span class="glyphicon glyphicon-plus"></span>
                NVA PREGUNTA
            </button>
            </div>
            
            <div class="listado-preguntas col-xs-12">
                <div class="item-listado-preguntas col-xs-12" ng-repeat="pregunta in arrPreguntas| filter:busqueda">
                    
                    <div class="id-pregunta col-xs-1">
                        <button class="btn btn-default" ng-click='entrarModoEdicion(pregunta)'>
                            {{pregunta.id}}
                        </button>
                    </div>
                    <div class="question-pregunta col-xs-11">
                        {{pregunta.pregunta}}
                        
                        <button class='btn btn-danger' style='float:right' ng-click='rmPregunta(pregunta)'>
                            <span class='glyphicon glyphicon-trash'></span>
                        </button>
                    </div>
                    <div class="answer-pregunta col-xs-11 col-xs-offset-1">
                        Respuesta:
                        <span ng-hide='pregunta.esImagen'> {{pregunta.respuesta}}</span>
                        <img ng-src="{{pregunta.respuesta}}" class="img img-responsive" ng-show='pregunta.esImagen' ng-disabled="!pregunta.esImagen"  ng-click="open(pregunta.respuesta)" style="cursor:pointer">
                    </div>
                </div>
            </div>
            
            
            <button type="button" class="btn boton-nueva-pregunta" ng-click="openModal()" style="margin-top:25px;">
                <span class="glyphicon glyphicon-plus"></span>
                NVA PREGUNTA
            </button>

            
        </div>
        
        <%@include file="modal-cargar-pregunta.jsp" %>
        
    </body>
    <script>
    app = angular.module('app', []);

    app.controller('machete', function($scope, $rootScope) 
    {
        
        $scope.arrPreguntas = [];
        $scope.modoEdicion = false;
        $scope.preguntaEditando;
        
        $scope.init = function()
        {
            $scope.findPreguntas();
        }
        $scope.findPreguntas = function()
        {
            $.ajax(
            {
                url:"../../findPreguntas",
                success: function (resultado, textStatus, jqXHR) 
                {
                    $scope.arrPreguntas = resultado;
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
            $("#myModal").modal();
        }
        $scope.openModal = function()
        {
            $scope.modoEdicion = false;
            $scope.preguntaEditando = null; 
            $("#myModal").modal();
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
    });
    </script>
</html>

<%-- 
    Document   : elegirMateria
    Created on : 20-jun-2017, 21:57:00
    Author     : Nico-Desktop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Elegir Materia</title>
        <%@include file="../comun/head.jsp" %>
        <style>
            .contenedor
            {
                background-color: white;
                padding:25px;
                margin-top:80px;
            }
            .texto-loading
            {
                text-align: center;
                background-color:rgba(0,0,0,0.25);
                color:white;
                padding:12px;
                margin:0px;
            }
            .materia-item
            {
                cursor:pointer;
                background-color:#1abc9c;
                text-align: center;
                color:white;
                font-weight: bold;
                padding:12px;
            }
            .head-listado-materias
            {
                text-align: center;
                background-color:rgba(0,0,0,0.25);
                margin:0px;
                padding:12px;
                margin-bottom: 12px;
                font-family: 'Raleway', sans-serif;
            }
        </style>
    </head>
    <body ng-app="app" ng-controller="machete" ng-init="init()"  ng-cloak>
        
        <div class="contenedor col-xs-8 col-xs-offset-2">
            
            <div class="col-xs-12" ng-show="cargandoMaterias">
                <img src="../res/img/loading.gif" class="img img-responsive center-block">
                <h3 class="texto-loading">Cargando Materias..</h3>
            </div>
            
            <!-- LISTADO DE MATERIAS:-->
            <h3 class="head-listado-materias">Materias:</h3>
            <div class="col-xs-12 col-sm-6" ng-repeat="materia in arrMaterias" ng-click="abrirMateria(materia)" >
                <div class="materia-item col-xs-12">
                    {{materia.nombre}}
                </div>
            </div>
            
            <div class="col-xs-12" style="padding-top:12px;">
                <button class="btn btn-default" ng-click="openModalMaterias()">
                    <span class="glyphicon glyphicon-plus"></span>
                    CARGAR MATERIA
                </button>
            </div>
        </div>
        
        
        
        <%@include file="modal-add-materia.jsp" %>
        
    </body>
    <script>
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
            window.location.href = "home.jsp";
            
        }
    });
    </script>
</html>

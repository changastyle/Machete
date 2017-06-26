<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONTROL REMOTO</title>
        <%@include file="../comun/head.jsp" %>
    </head>
    <body ng-app="app" ng-controller="controlRemoto" ng-clock ng-init="init()">
        <h1>Control Remoto!
            <button class="btn btn-danger" ng-click="tomarFoto()">
                <span class="glyphicon glyphicon-picture"></span>
                TOMAR FOTO
            </button>
            
            <button class="btn btn-warning" ng-click="refrescarFotos()">
                <span class="glyphicon glyphicon-refresh"></span>
                REFRESCAR
            </button>
            
        </h1>
        <h3>1 - PRIMERO TOMAR LA FOTO <br> 2 - ESPERAR 1 SEGUNDO Y REFRESCAR</h3>
        
        <div class="contenedor-fotos">
            
            <!--LOADING:-->
            <div class="col-xs-12" ng-show="cargandoPreguntas">
                <img src="../res/img/loading.gif" class="img img-responsive center-block">
                <h3 class="texto-loading">REFRESCANDO</h3>
            </div>
            
            <div class="item-foto" ng-repeat="foto in arrFotos">
                <h3 class="tiempo-trans">Foto tomada hace {{foto.tiempoTrans}}</h3>
                <img ng-src="{{foto.url}}" class="img img-responsive center-block">
            </div>
        </div>
    
    </body>
    <script src="control-remoto-controller.js"></script>
    <style>
        .item-foto
        {
            background-color:white;
            margin-bottom: 50px;
        }
        .tiempo-trans
        {
            text-align: center;
            background-color:#1abc9c;
            color:white;
            padding:25px;
        }
    </style>
</html>

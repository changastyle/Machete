<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONTROL REMOTO</title>
        <%@include file="../comun/head.jsp" %>
    </head>
    <body ng-app="app" ng-controller="controlRemoto" ng-clock ng-init="init()">
        
        <!-- HEAD CONTROL REMOTO:-->
        <h1 class="h-control-remoto">Control Remoto</h1>
        
        <!-- CONTENEDOR BOTON ACCIONES:-->
        <div class="contenedor-boton-acciones col-xs-12">
            <button class="btn btn-danger" ng-click="tomarFoto()">
                <span class="glyphicon glyphicon-picture"></span>
                TOMAR FOTO
            </button>

            <button class="btn btn-warning" ng-click="refrescarFotos()">
                <span class="glyphicon glyphicon-refresh"></span>
                REFRESCAR
            </button>
        </div>
        
        <div class="contenedor-fotos col-xs-12">
            
            <!--LOADING:-->
            <div class="col-xs-12">
                <div class="col-xs-4 col-xs-offset-4" id="loading">
                    <img src="../res/img/loading.gif" class="img img-responsive center-block" >
                    <h3 class="texto-loading">Refrescando ..</h3>
                </div>
            </div>
            
            <!-- FOTOS MINIATURA:-->
            <div class="item-foto col-xs-4" ng-repeat="foto in arrFotos" ng-click="agrandarFoto(foto)">
                <div class="padding-item-foto col-xs-12">
                    
                    <img ng-src="{{foto.url}}" class="miniatura img img-responsive center-block">
                    
                    <h3 class="tiempo-trans">
                        # {{foto.id}} <span class="time">{{foto.tiempoTrans}}</span>
                    </h3>
                </div>
            </div>
        </div>
    
        
        <div class="maximo" hidden>
            <img id="img-maximo"  class="img img-responsive center-block" ng-click="cerrarFotoMaximo()">
        </div>
    </body>
    <script src="control-remoto-controller.js"></script>
    <style>
        .item-foto
        {
            margin-bottom: 50px;
            cursor:pointer;
            border-radius: 6px;
            overflow: hidden;
            //border:solid 1px black;
        }
        .padding-item-foto
        {
           background-color:white; 
           border-radius: 6px;
           overflow: hidden;
           margin-bottom: 12px;
        }
        .maximo
        {
            position: fixed;
            top:0px;
            width: 100%;
            height: 100%;
            left:0px;
            background-color: rgba(0,0,0,0.45);
        }
        #img-maximo
        {
            //border: solid 2px black;
            height: 100%;
            width: auto;
        }
        .tiempo-trans
        {
            text-align: center;
            background-color:#1abc9c;
            color:white;
            padding:25px;
            border-radius: 6px;
        }
        .miniatura
        {
            margin-top:12px;
        }
        .h-control-remoto
        {
            text-align: center;
            background-color: #1abc9c;
            color: white;
            margin-top:0px;
            padding:25px;
            margin-bottom:0px;
        }
        .contenedor-boton-acciones
        {
            background-color: white;
            padding:12px;
            text-align: center;
        }
        #loading{
            background-color: white;
            border-radius: 6px;
            margin-top: 25px;
            margin-bottom: 25px;
        }
        .texto-loading
        {
            text-align: center;
        }
        .time
        {
            background-color: rgba(0,0,0,0.45);
            padding: 8px;
            border-radius: 6px;
            
        }.contenedor-fotos{
            padding-top: 25px;
        } 
    </style>
</html>

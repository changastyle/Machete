<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../comun/head.jsp" %>
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
        <title>MACHETE</title>
    </head>
    <body ng-app="app" ng-controller="machete" ng-init="init()"  ng-cloak>
        
        
        
        <div class="contenedor-preguntas col-xs-12 col-xs-offset-0 col-md-8 col-md-offset-2">
            
            <h1 class="head-machete col-xs-12">Listado de Preguntas</h1>
            
            <div class="form-group">
                <label>Seleccionar Tema</label>
                <select class="form-control" ng-options="tema as tema.nombre for tema in materia.temasList" ng-model="temaSeleccionado" ng-change="cambioComboTemas()">
                </select>
            </div>
            <div class="form-group">
                <label>Barra busqueda</label>
                <div class="input-group">
                    <input type="search" class="form-control" placeholder="Buscá tu pregunta rapidamente.." ng-model="busqueda">
                    <span class="input-group-addon" id="basic-addon1" ng-click='limpiarBarraBusqueda()' style='cursor: pointer'>
                        <span class='glyphicon glyphicon-remove' ></span>
                    </span>
                </div>
            </div>
            
            
            <%@include file="botonera-preguntas.jsp"  %>
            
            
            <div class="listado-preguntas col-xs-12">
                
                <div class="col-xs-12" ng-show="cargandoFotos">
                    <img src="../res/img/loading.gif" class="img img-responsive center-block">
                    <h3 class="texto-loading">Cargando Materias..</h3>
                </div>
                
                <div class="item-listado-preguntas col-xs-12" ng-repeat="pregunta in arrPreguntas| filter:busqueda" ng-hide="cargandoFotos">
                    
                    <div class="id-pregunta col-md-1 col-xs-12  hidden-xs">
                        <button class="btn btn-default" ng-click='entrarModoEdicion(pregunta)'>
                            {{pregunta.id}}
                        </button>
                    </div>
                    <div class="question-pregunta col-md-11 col-xs-12">
                        {{pregunta.pregunta}}
                        
                        <br>
                        <div class="chip">
                            {{pregunta.tema.nombre}}
                        </div>
                        
                        
                        <button class='btn btn-danger hidden-xs' style='float:right' ng-click='rmPregunta(pregunta)'>
                            <span class='glyphicon glyphicon-trash'></span>
                        </button>
                    </div>
                    <div class="answer-pregunta col-md-11 col-md-offset-1 col-xs-12">
                        Respuesta:
                        <span ng-hide='pregunta.esImagen'> {{pregunta.respuesta}}</span>
                        <img ng-if="pregunta.esImagen" ng-src="{{pregunta.respuesta}}" class="img img-responsive" ng-show='pregunta.esImagen' ng-disabled="!(pregunta.esImagen)"  ng-click="open(pregunta.respuesta)" style="cursor:pointer">
                    </div>
                </div>
            </div>
            
            
            <%@include file="botonera-preguntas.jsp"  %>

            
        </div>
        
        <%@include file="modal-cargar-pregunta.jsp" %>
        <%@include file="modal-add-tema.jsp" %>
        
    </body>
    <script src="preguntas-controller.js"></script>
    <style>
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
                margin-top: 12px;
                margin-bottom: 12px;
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
</html>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" ng-hide='modoEdicion'>CARGAR UNA NUEVA PREGUNTA</h4>
                <h4 class="modal-title" ng-show='modoEdicion'>EDITAR UNA PREGUNTA</h4>
            </div>
            <div class="modal-body">
                
                <div class="form-group">
                    <label>Pregunta</label>
                    <input type="text" ng-model="preguntaEditando.pregunta" class="form-control" placeholder="Quien fue Cristobal Colon?">
                </div>
                <div class="form-group">
                    <label>Respuesta</label>
                    <input type="text" ng-model="preguntaEditando.respuesta" class="form-control" placeholder="Un guacho">
                </div>
                <div class="form-group">
                    <label>Tema</label>
                    <select ng-model="preguntaEditando.tema" class="form-control" ng-options="tema as tema.nombre for tema in materia.temasList">
                    </select>
                </div>
                <div class="form-group">
                    <label>Es Imagen?</label>
                    <input type="checkbox" ng-model="preguntaEditando.esImagen">
                </div>

                
                
            </div>
            <div class="modal-footer">
                <div class="btn boton-nueva-pregunta col-xs-12" ng-click='addPregunta()' ng-hide='modoEdicion'>
                    <span class="glyphicon glyphicon-ok"></span>
                    GUARDAR PREGUNTA
                </div>
                <div class="btn btn-primary col-xs-12" ng-click='editPregunta()' ng-show='modoEdicion'>
                    <span class="glyphicon glyphicon-pencil" ></span>
                    EDITAR PREGUNTA
                </div>
            </div>
        </div>
    </div>
</div>
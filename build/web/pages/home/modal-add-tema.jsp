<!-- Modal -->
<div id="modal-temas" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">AGREGAR TEMA</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>
                        Nombre Tema
                    </label>
                    <input type="text" placeholder="Jacobiano.." ng-model="tema.nombre" class="form-control">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal" ng-click="addTema()">
                    <span class="glyphicon glyphicon-ok"></span>
                    AGREGAR MATERIA
                </button>
            </div>
        </div>
    </div>
</div>
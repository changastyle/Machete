<!-- Modal -->
<div id="modal-materias" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">AGREGAR MATERIA</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>
                        Nombre Materia
                    </label>
                    <input type="text" placeholder="Calculo Avanzado.." ng-model="materia.nombre" class="form-control">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal" ng-click="addMateria()">
                    <span class="glyphicon glyphicon-ok"></span>
                    AGREGAR MATERIA
                </button>
            </div>
        </div>
    </div>
</div>
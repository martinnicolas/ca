class ReclamoDatatable < AjaxDatatablesRails::Base

  include AjaxDatatablesRails::Extensions::Kaminari

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['Reclamo.titulo', 'Reclamo.descripcion', 'Reclamo.fecha', 'TipoReclamo.nombre']
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ['Reclamo.titulo', 'Reclamo.descripcion', 'Reclamo.fecha', 'TipoReclamo.nombre']
  end

  private

  def data
    records.map do |record|
      [
        record.titulo,
        record.descripcion,
        record.fecha.to_s(:default),
        record.tipo_reclamo.to_s,
        '<div class="dropdown">
          <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">
            Acciones
            <span class="caret"></span>
          </button>
          <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
            <li role="presentation"><a role="menuitem" tabindex="-1" href="'+Rails.application.routes.url_helpers.reclamo_path(record.id.to_s)+'">Ver</a></li>
            <li role="presentation"><a role="menuitem" tabindex="-1" href="'+Rails.application.routes.url_helpers.edit_reclamo_path(record.id.to_s)+'">Editar</a></li>
            <li role="presentation"><a rel="nofollow" data-method="delete" data-confirm="Estás seguro de querer eliminar este Reclamo?" role="menuitem" tabindex="-1" href="'+Rails.application.routes.url_helpers.reclamo_path(record.id.to_s)+'">Eliminar</a></li>
          </ul>
        </div>',
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
      ]
    end
  end

  def get_raw_records
    # insert query here
    current_user = options[:current_user]
    return Reclamo.joins(:tipo_reclamo).where(:user_id => current_user.id)
  end

  # ==== Insert 'presenter'-like methods below if necessary
end

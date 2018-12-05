class ReclamoDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view, :link_to, :reclamo_path

  def view_columns
    @view_columns ||= {
      titulo:      { source: "Reclamo.titulo", cond: :like },
      descripcion: { source: "Reclamo.descripcion", cond: :like },
      fecha:       { source: "Reclamo.fecha", cond: :like },
      nombre:      { source: "TipoReclamo.nombre", cond: :like },
      acciones:    { source: "Reclamo.id" }
    }
  end

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  private
  
  def data
    records.map do |record|
      {
        titulo: record.titulo,
        descripcion: record.descripcion,
        fecha: record.fecha.to_s(:default),
        nombre: record.tipo_reclamo.to_s,
        acciones: link_to('Ver', reclamo_path(record), :class => 'btn btn-sm btn-default')
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
      }
    end
  end

  def get_raw_records
    # insert query here
    current_user = options[:current_user]
    return Reclamo.joins(:tipo_reclamo).where(:user_id => current_user.id)
  end

  #def sort_records(records)
  #  debugger
  #
  #end

  # ==== Insert 'presenter'-like methods below if necessary
end

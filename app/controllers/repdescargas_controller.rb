class RepdescargasController < ApplicationController
  def index
  end

  def create
  	@fechadesde = params[:fechadesde]
  	@fechahasta = params[:fechahasta]
  	@libros = ActiveRecord::Base.connection.execute("SELECT title,libro_id,nombre_area,nombre_asignatura, COUNT (libro_id)FROM v_descargas where fecha >= '#{@fechadesde}' and fecha <= '#{@fechahasta}' GROUP BY
    title,libro_id, nombre_area,nombre_asignatura")
    render :partial=> 'repdescarga'
  end
end

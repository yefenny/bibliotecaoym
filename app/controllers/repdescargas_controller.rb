class RepdescargasController < ApplicationController
  def index
  end

  def create
  	@fechadesde = params[:fechadesde]
  	@fechahasta = params[:fechahasta]
    @libros = Repdescarga.where("fecha >= '#{@fechadesde}' and fecha <= '#{@fechahasta}'").group("title,libro_id, nombre_area,nombre_asignatura").select("title,libro_id,nombre_area,nombre_asignatura, COUNT (libro_id) as cantidad")
    render :partial=> 'repdescarga'
  end
end

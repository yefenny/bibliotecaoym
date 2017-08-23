class RepdescargasController < ApplicationController
before_action :authenticate_user!	
  def index
  	if current_user.rol_id == 1 || current_user.rol_id == 2 
  	else
  		render 'menu/noautorizado'
    end    	
  end

  def create
  	if current_user.rol_id == 1 || current_user.rol_id == 2 
	  	@fechadesde = params[:fechadesde]
	  	@fechahasta = params[:fechahasta]
	    @libros = Repdescarga.where("fecha >= '#{@fechadesde}' and fecha <= '#{@fechahasta}'").group("title,libro_id,nombre_area,nombre_asignatura").select("title,libro_id,nombre_area,nombre_asignatura, COUNT (libro_id) as cantidad")
	    #@libro = Vbuscalibronombre.joins("left join librodescargas on v_busca_libros_nombre.libro_id = librodescargas.libro_id").group("title,libro_id, nombre_area,nombre_asignatura").select("v_busca_libros_nombre.*, count(librodescargas.id) as cuenta_tweets")
	    render :partial=> 'repdescarga'
	else
	   render 'menu/noautorizado'
    end     
  end
end

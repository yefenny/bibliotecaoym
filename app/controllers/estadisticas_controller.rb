class EstadisticasController < ApplicationController
  before_action :authenticate_user!
  def index

  end
  def show
    if current_user.rol_id == 1 || current_user.rol_id == 2
    	fecha = params[:fecha]
    	fecha = fecha.to_date
    	@tipo = params[:tipo] 
    	if params[:tipo] == "semestre"
  	  	fecha_final = fecha + 6.months
  	  	@texto = "Estadística de descargas por semestre"
  	  	@libro = Libro.joins("left join librodescargas on libros.id = librodescargas.libro_id").where("fecha_descarga >= '#{fecha}' and fecha_descarga < '#{fecha_final}'").group("libros.id, librodescargas.libro_id").select("libros.*, count(librodescargas.id) as cuenta_tweets").collect{|x| [x.title, x.cuenta_tweets]}
  	  elsif params[:tipo] == "mes"
    		@texto = "Estadística de descargas por mes"
    		fecha_final = fecha + 1.months
    		@libro = Libro.joins("left join librodescargas on libros.id = librodescargas.libro_id").where("fecha_descarga >= '#{fecha}' and fecha_descarga < '#{fecha_final}'").group("libros.id, librodescargas.libro_id").select("libros.*, count(librodescargas.id) as cuenta_tweets").collect{|x| [x.title, x.cuenta_tweets]}	
  	  elsif params[:tipo] == "area"
    		@texto = "Estadística de descargas por areas del saber"
    		@libro = Vbuscalibronombre.joins("left join librodescargas on v_busca_libros_nombre.libro_id = librodescargas.libro_id").group("v_busca_libros_nombre.area_nombre").select("v_busca_libros_nombre.area_nombre, count(librodescargas.id) as cuenta_tweets").collect{|x| [x.area_nombre, x.cuenta_tweets]}
  	  end  
    	respond_to do |format|
        format.js
      end	
    else
           render 'menu/noautorizado'
     end  		
  end	
end

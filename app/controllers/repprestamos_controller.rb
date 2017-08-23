class RepprestamosController < ApplicationController
  def index
  	@buscarl = "buscar"
  	@libros = Libro.order("title").all
  end
  def create
  	@buscarpor = params[:group1]
  	@fechadesde = params[:fechadesde].to_date.strftime("%Y-%m-%d")
  	@fechahasta = params[:fechahasta].to_date.strftime("%Y-%m-%d")
  	@fechaahora = Time.now.strftime("%Y-%m-%d")
  	@estudiante_matricula = params[:estudiante_matricula]
  	@libro_id = params[:libro_id]
  	sql = ""
  	if @buscarpor == "activos"
  		sql +="fechad IS NULL and fechae >= '#{@fechaahora}' "
  	elsif @buscarpor =="todos"	
  		sql +="fechap = fechap"
  	elsif @buscarpor =="devueltos"	
  		sql +="fechad is not NULL"
  	elsif @buscarpor =="vencidos"
  		sql +="fechad IS NULL and fechae < '#{@fechaahora}' "		
  	end 
  	if @estudiante_matricula != ""
  		sql+= " and matricula ilike '#{@estudiante_matricula}'"
  	end	
  	if @libro_id != ""
  		sql+= " and libro_id = #{@libro_id}"
  	end	
  	if @fechadesde !="" && @fechahasta !="" && @buscarpor =="todos"
  		sql+= " and fechap >= '#{@fechadesde}' and fechap <= '#{@fechahasta}'"
  	end	

  	@rep = Repprestamo.where(sql).all
  	render :partial=> 'repprestamo'
  end
end

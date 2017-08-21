class BuscarController < ApplicationController
  def show
  	@controller = params[:el_controller]
  	buscar_por = params[:buscar_por]
  	buscar_texto = params[:buscar_texto]
  	if @controller == "libros"
  		if buscar_por == "nombre"
  			@libros = Vbuscalibro.where("unaccent(title) ilike unaccent(?)", "%#{buscar_texto}%").all
  		elsif buscar_por == "asignatura"
  			@libros = Vbuscalibro.where("unaccent(nombre_asignatura) ilike unaccent(?)", "%#{buscar_texto}%").all
  		elsif buscar_por == "area"
  			@libros = Vbuscalibro.where("unaccent(nombre_area) ilike unaccent(?)", "%#{buscar_texto}%").all
  		end 					
  	end
  	if @controller == "estudiantes"
  		if buscar_por == "nombre"
  			@estudiantes = Estudiante.where("unaccent(name) ilike unaccent(?)", "%#{buscar_texto}%").all
  		elsif buscar_por == "matricula"
  			@estudiantes = Estudiante.where("unaccent(matricula) ilike unaccent(?)", "%#{buscar_texto}%").all
  		end 
  	end 
     if @controller == "prestamos"	
      if params[:option] ="libros"
        @libros = Libro.where("unaccent(title) ilike unaccent(?)", "%#{buscar_texto}%").all
      end
     end
     if @controller == "usuarios"
      if buscar_por == "email"
        @usuarios = User.where("unaccent(email) ilike unaccent(?)", "%#{buscar_texto}%").all
      elsif buscar_por == "nombre"
        @usuarios = User.where("unaccent(name) ilike unaccent(?)", "%#{buscar_texto}%").all
      end 
    end 

  	respond_to do |format|
        format.js
    end
  end
end

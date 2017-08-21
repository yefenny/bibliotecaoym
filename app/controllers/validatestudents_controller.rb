class ValidatestudentsController < ApplicationController
   before_action :authenticate_user!
  def new
  	if current_user.rol_id == 5
    else
         render 'menu/noautorizado'
    end   
  end

  def create
  	if current_user.rol_id == 5
	  	estudiante_matricula = params[:matricula]
		estudiante_clave = params[:clave]
		estudiantes = Estudiante.all

		studentidv = 0 			# Almacena el el id del estudiante con el que coincide la matricula y clave estudiantil
		dtsocupados = 0			# verificar si los datos estan ocupados
		noexist = 0 			# Validar existencia de datos
		estudiantes.each do |e|
			puts e.matricula
			if e.matricula == estudiante_matricula && e.clave == estudiante_clave.to_s
				
				if e.user_id == nil || e.user_id == 0
					studentidv = e.id
					break
				else
					dtsocupados = 1 #Los datos coinciden con un estudiante pero ya estaban siendo utilizados 
				end	
			end
		end
		if studentidv != 0 && studentidv != nil
			estudiante = Estudiante.where("id = #{studentidv}").first
			estudiante.user_id = current_user.id
			current_user.estudiante_id = estudiante.id
			current_user.save
			estudiante.save
			redirect_to  root_path
		else	
			if dtsocupados == 1
				puts 'ocupado'
				flash[:error] = "Ya existe un usuario con los datos de este estudiante !"
				redirect_to '/validatestudents/new'
			else
				puts 'nocoinciden'
				flash[:error] = "Los datos no coinciden con el de ningún estudiante!"
				redirect_to '/validatestudents/new'
			end	
		end
	else
		 render 'menu/noautorizado'
	end	

  end
end

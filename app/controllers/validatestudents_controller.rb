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
	  	if estudiante_matricula !="" && estudiante_matricula != nil
	  		estudiante_matricula = estudiante_matricula.mb_chars.upcase
	  	end	
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
			usuario = User.where("id = #{current_user.id}").first
			usuario.rol_id = 4
			usuario.estudiante_id = estudiante.id
			usuario.save
			estudiante.save
			redirect_to  root_path
		else	
			if dtsocupados == 1
				puts 'ocupado'
				$errormsg = "Ya existe un usuario con los datos de este estudiante !"
				redirect_to '/validatestudents/new'
			else
				puts 'nocoinciden'
				$errormsg = "Los datos no coinciden con el de ningún estudiante!"
				redirect_to '/validatestudents/new'
			end	
		end
	else
		 render 'menu/noautorizado'
	end	

  end
end

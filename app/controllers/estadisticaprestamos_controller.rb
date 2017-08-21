class EstadisticaprestamosController < ApplicationController
before_action :authenticate_user!	
  def index
	   if current_user.rol_id == 1 || current_user.rol_id == 2
	  		 @book = Cantidadlibro.all
	   else
	         render 'menu/noautorizado'
	   end 	

  end

  def show
  end
end

class EstudiantesController < ApplicationController
  before_action :authenticate_user!
  
  def index   
      if current_user.rol_id == 1 || current_user.rol_id == 2 || current_user.rol_id == 3

        @estudiantes = Estudiante.order("name").all
      else
         render 'menu/noautorizado'
      end   
   end

   def show
      
      if current_user.rol_id == 1 || current_user.rol_id == 2 || current_user.rol_id == 3

       @estudiante = Estudiante.find(params[:id])
      else
         render 'menu/noautorizado'
      end   
   end

   def estudiantes_param
     if current_user.rol_id == 1 
      params.require(:estudiante).permit(:name, :lastname, :matricula, :clave)
     end 
   end

  def new
    if current_user.rol_id == 1 

        @estudiante = Estudiante.new
      else
         render 'menu/noautorizado'
      end   
  end

  def create
  	

      if current_user.rol_id == 1 
        @estudiante = Estudiante.new(estudiantes_param)
        if @estudiante.save
          redirect_to :action => 'index'
        else
          render 'new'
        end 
      else
         render 'menu/noautorizado'
      end   
  end

  def edit

      if current_user.rol_id == 1 
        @estudiante = Estudiante.find(params[:id])
      else
         render 'menu/noautorizado'
      end   

  end

   def estudiante_param
      params.require(:estudiante).permit(:name, :lastname, :matricula, :clave)
   end
  def update
  
      if current_user.rol_id == 1 
        @estudiante = Estudiante.find(params[:id])
        if @estudiante.update_attributes(estudiante_param)
           redirect_to :action => 'show', :id => @estudiante
        else
           render :action => 'edit'
        end
      else
         render 'menu/noautorizado'
      end   

  end

  def delete
    
       if current_user.rol_id == 1 

         @estudiante = Estudiante.find(params[:id])
         if @estudiante.user_id != nil && @estudiante.user_id != 0
            userid = @estudiante.user_id
            @user = User.where("id = #{userid}").first
            @user.estudiante_id = nil
            @user.rol_id = 5 
            @user.save
         end  
         Estudiante.find(params[:id]).delete 
         redirect_to :action => 'index'
      else
          render 'menu/noautorizado'
      end   
  end

 
    

end

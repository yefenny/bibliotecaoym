class AsignaturasController < ApplicationController
  def list
      if current_user.rol_id == 1 || current_user.rol_id == 2 || current_user.rol_id == 3
         @asignaturas = Asignatura.order("name").all
      else
         render 'menu/noautorizado'
      end   
   end

   def show
      if current_user.rol_id == 1 || current_user.rol_id == 2 || current_user.rol_id == 3
         @asignatura = Asignatura.find(params[:id])
      else
         render 'menu/noautorizado'
      end   
   end
  
   def new
      if current_user.rol_id == 1 || current_user.rol_id == 2 
         @asignatura = Asignatura.new
         @areasconocimiento = Areasconocimiento.all
      else
         render 'menu/noautorizado'
      end   
   end

   def asignaturas_params
      params.require(:asignatura).permit(:name, :areasconocimiento_id)
   end

   def create
      if current_user.rol_id == 1 || current_user.rol_id == 2 
         @asignatura = Asignatura.new(asignaturas_params)
         if @asignatura.save
            redirect_to :action => 'list'
         else
            @areasconocimiento = Areasconocimiento.all
            render :action => 'new'
         end
      else
         render 'menu/noautorizado'
      end   
   end
   
   def edit
      if current_user.rol_id == 1 || current_user.rol_id == 2 
         @asignatura = Asignatura.find(params[:id])
         @areasconocimiento = Areasconocimiento.all
      else
         render 'menu/noautorizado'
      end   
   end
   
   def asignatura_params
      params.require(:asignatura).permit(:name, :areasconocimiento_id)
   end
   
   def update
      if current_user.rol_id == 1 || current_user.rol_id == 2 
         @asignatura = Asignatura.find(params[:id])
         if @asignatura.update_attributes(asignatura_params)
            redirect_to :action => 'show', :id => @asignatura
         else
            @areasconocimiento = Areasconocimiento.all
            render :action => 'edit'
         end
      else
         render 'menu/noautorizado'
      end   
   end
end

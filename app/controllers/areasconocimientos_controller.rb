class AreasconocimientosController < ApplicationController
  def index
    if current_user.rol_id == 1 || current_user.rol_id == 2 
         @areasconocimientos = Areasconocimiento.order("name").all
    else
         render 'menu/noautorizado'
    end   
  end

  def show
    if current_user.rol_id == 1 || current_user.rol_id == 2 
         @areasconocimiento = Areasconocimiento.find(params[:id])
    else
         render 'menu/noautorizado'
    end   
  end

  def new
    if current_user.rol_id == 1 || current_user.rol_id == 2 
         @areasconocimiento = Areasconocimiento.new
    else
         render 'menu/noautorizado'
    end   
  end

   def areas_params
      params.require(:areasconocimiento).permit(:name)
   end

   def create
    if current_user.rol_id == 1 || current_user.rol_id == 2 
        @areasconocimiento = Areasconocimiento.new(areas_params)
        if @areasconocimiento.save
           redirect_to :action => 'index'
        else
           render :action => 'new'
        end
    else
         render 'menu/noautorizado'
    end   
   end

  def edit
    if current_user.rol_id == 1 || current_user.rol_id == 2 
         @areasconocimiento = Areasconocimiento.find(params[:id])
    else
         render 'menu/noautorizado'
    end    
   end
   
   def area_params
    if current_user.rol_id == 1 || current_user.rol_id == 2 
      params.require(:areasconocimiento).permit(:name)
    end  
   end
   
   def update
    if current_user.rol_id == 1 || current_user.rol_id == 2 
         @areasconocimiento = Areasconocimiento.find(params[:id])
      if @areasconocimiento.update_attributes(area_params)
         redirect_to :action => 'show', :id => @areasconocimiento
      else
         render :action => 'edit'
      end
    else
         render 'menu/noautorizado'
    end   
   end
end

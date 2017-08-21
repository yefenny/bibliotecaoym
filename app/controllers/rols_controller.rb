class RolsController < ApplicationController
  before_action :authenticate_user!
  def list
    if current_user.rol_id == 1 
         @rols = Rol.order("name").all
    else
         render 'menu/noautorizado'
    end   
  end

  def show
    if current_user.rol_id == 1 
        @rol = Rol.find(params[:id])
    else
         render 'menu/noautorizado'
    end   
  end

  def new
    if current_user.rol_id == 1 
        @rol = Rol.new
    else
         render 'menu/noautorizado'
    end   
  end

   def rols_params
      params.require(:rol).permit(:name)
   end

   def create
    if current_user.rol_id == 1 
        @rol = Rol.new(rols_params)
        if @rol.save
           redirect_to :action => 'list'
        else
           render :action => 'new'
        end
    else
         render 'menu/noautorizado'
    end   
   end

  def edit
    if current_user.rol_id == 1 
        @rol = Rol.find(params[:id])
    else
         render 'menu/noautorizado'
    end   
  end
   
   def rol_params
      params.require(:rol).permit(:name)
   end
   
   def update
    if current_user.rol_id == 1 
      @rol = Rol.find(params[:id])
      if @rol.update_attributes(rol_params)
         redirect_to :action => 'show', :id => @rol
      else
         render :action => 'edit'
      end
    else
         render 'menu/noautorizado'
    end    
   end
=begin
  
def delete
  end
  
=end
  
end

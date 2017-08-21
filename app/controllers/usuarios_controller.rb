class UsuariosController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.rol_id == 1 || current_user.rol_id == 2 

        @usuarios = User.order("name").all
      else
         render 'menu/noautorizado'
      end   
  end

  def show
    if current_user.rol_id == 1 || current_user.rol_id == 2 
      @usuario = User.find(params[:id])
    else
         render 'menu/noautorizado'
    end     
  end

  def new
    if current_user.rol_id == 1 || current_user.rol_id == 2  
      @usuario = User.new
    else
         render 'menu/noautorizado'
    end     
  end
  def user_params
      params.require(:user).permit(:email, :name, :lastname, :rol_id, :password, :password_confirmation, :created_by)
   end

  def create
    if current_user.rol_id == 1 || current_user.rol_id == 2 
         @usuario = User.new(user_params)
         if @usuario.save
           redirect_to :action => 'index'
         else
           render :action => 'new'
         end 
    else
         render 'menu/noautorizado'
    end   

  end

  def edit
    if current_user.rol_id == 1 
         @usuario = User.find(params[:id])
    else
         render 'menu/noautorizado'
    end   

  end

  def users_params
      params.require(:user).permit(:email, :name, :lastname, :rol_id, :updated_by)
   end

  def update
    if current_user.rol_id == 1 
         @usuario = User.find(params[:id])
         if @usuario.update_attributes(users_params)
            redirect_to :action => 'show', :id => @usuario
         else
            render :action => 'edit'
         end
    else
         render 'menu/noautorizado'
    end  
  end
def destroy
 if current_user.rol_id == 1 
        @user = User.find(params[:id])
        nulo = @user.estudiante
        if nulo != nil
          @user.estudiante.user_id = nil
          @user.estudiante.save
        end  
         User.find(params[:id]).destroy
         redirect_to :action => 'index'
      else
         render 'menu/noautorizado'
      end
end      


end

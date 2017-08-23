class LibrosController < ApplicationController
   before_action :authenticate_user!

  def index
         @libros = Libro.order("title").all  
  end

   def show
      @libro = Libro.find(params[:id])
   end
   def new
      if current_user.rol_id == 1 || current_user.rol_id == 2 || current_user.rol_id == 3

         @libro = Libro.new
         @asignaturas = Asignatura.all
      else
         render 'menu/noautorizado'
      end   
   end

   def libro_params
      params.require(:libro).permit(:title, :author, :edition, :publicationdate, :casaeditora, :description, :asignatura_id, :image, :fisico)
   end

   def create
      
      if current_user.rol_id == 1 || current_user.rol_id == 2 || current_user.rol_id == 3

         @libro = Libro.new(libro_params)
         cantidad = params[:cantidad] 
         check = "0"
         check = params[:fisico].to_s.downcase   
         puts "valorrrrrrrrrrrrrrrrrrrrr #{check}"  
            if params[:fisico].to_s !='0'   #VALIDAR SI ES FISICO
               @libro.fisico = true
            else
               @libro.fisico = false

            end  
         @cantidad = Cantidadlibro.new #INGRESAR LA CANTIDAD DE LIBROS
         if @libro.save
            if @libro.image.exists? #VALIDAR SI ES DIGITAL
               @libro.digital = true
               @libro.save
            else
               @libro.digital = false
               @libro.save
            end  
            if params[:fisico].to_s !='0'  
               @cantidad.cantidad = params[:cantidad]
               @cantidad.cantidad_total = params[:cantidad]
               @cantidad.libro_id = @libro.id
               @cantidad.save
            end
            redirect_to :action => 'index'
         else
            @asignaturas = Asignatura.all
            render :action => 'new'
         end
         else
         render 'menu/noautorizado'
      end   
   end
   
   def edit
      if current_user.rol_id == 1 || current_user.rol_id == 2 || current_user.rol_id == 3
         @libro = Libro.find(params[:id])
         @asignaturas = Asignatura.all
         libro = params[:libro_id]
      @cantidad = Cantidadlibro.where(:libro_id => libro)
      else
         render 'menu/noautorizado'
      end   


   end
   
   def libro_param
      params.require(:libro).permit(:title, :author, :edition, :publicationdate, :casaeditora, :description, :asignatura_id, :image)
   end
   
   def update
     

      if current_user.rol_id == 1 || current_user.rol_id == 2 || current_user.rol_id == 3
         @libro = Libro.find(params[:id])
         check = params[:echeck]
         libro = params[:libro_id]
         cantidad = params[:cantidad]
         if cantidad !='0' && cantidad != ''
               @libro.fisico = true
         else
               @libro.fisico = false    
         end 
         @cantidad = Cantidadlibro.where("libro_id = #{params[:id]}").first
         if @libro.update_attributes(libro_param)
               if @libro.image.exists?
                  @libro.digital = true
                  @libro.save
               end   
                @cantidad.cantidad_total = cantidad
                @cantidad.save 
                
            redirect_to :action => 'show', :id => @libro
         else
            @asignaturas = Asignatura.all
            render :action => 'edit'
         end
      else
         render 'menu/noautorizado'
      end   
   end
   
   def destroy
      if current_user.rol_id == 1 || current_user.rol_id == 2 || current_user.rol_id == 3
         @libros = Libro.find(params[:id])
         @prestamos = Prestamo.where("libro_id = #{@libros.id} and fechad is null").count
         if @prestamos == 0
            Libro.find(params[:id]).destroy
            libro = params[:id]
            Prestamo.where(:libro_id => libro).destroy_all
            Librodescarga.where(:libro_id => libro).destroy_all
            Cantidadlibro.where("libro_id = #{params[:id]}").destroy_all
         else  
            $errormsg = "Este libro tiene prestamos activos, no puede ser eliminado"  
         end 
         redirect_to :action => 'index'  
      else
         render 'menu/noautorizado'
      end   
   end

   def pdf
      @libro = Libro.find(params[:id])
      titulo = "#{@libro.title}.pdf"
      if send_file @libro.image.path.to_s, :type => 'application/pdf',  :disposition => 'inline', :filename => titulo
         #@libro.librodescarga.fecha_descarga = Time.now
         res = ActiveRecord::Base.connection.execute("INSERT INTO librodescargas(libro_id, fecha_descarga,created_at, 
            updated_at) VALUES ('#{@libro.id}','#{Time.now}', current_TIMESTAMP,current_TIMESTAMP )")
      end  
      

   end  
end

class PrestamosController < ApplicationController
before_action :authenticate_user!
  def index
    if current_user.rol_id == 1 || current_user.rol_id == 2 || current_user.rol_id == 3
      @prestamos = Prestamo.where("fechad IS NULL").all
      @opcion = "todos"
    else
         render 'menu/noautorizado'
    end   
  end

  def show
    if current_user.rol_id == 1 || current_user.rol_id == 2 || current_user.rol_id == 3
      if params[:id]
        @prestamo = Prestamo.find(params[:id])
        fechahoy =  Time.now.strftime("%Y-%m-%d")
        @dias = (@prestamo.fechae.to_s.gsub("-", "").to_i - fechahoy.gsub("-", "").to_i).to_i
        puts "estos son los diaaaaaaaaas #{@dias} "
        if fechahoy > @prestamo.fechae 
          @prestamo.mora_id = 2 
        end  
          respond_to do |format|
            format.html
          end
      else
          if params[:option] == 'validar_estudiante' 
            @option = params[:option]
            matricula = params[:matricula]
            libroid = params[:libro]
            @estudiante = Estudiante.where("matricula ilike '#{matricula}'").first
            @libro = Libro.where("id = #{libroid}").first
            respond_to do |format|
                format.js
            end
          end  
      end
    else
         render 'menu/noautorizado'
    end            
  end 
  
  def new
    if current_user.rol_id == 1 || current_user.rol_id == 2 || current_user.rol_id == 3
         @prestamo = Prestamo.new
         @libros = Libro.order("title").all
    else
         render 'menu/noautorizado'
    end 
  end

  def create
    if current_user.rol_id == 1 || current_user.rol_id == 2 || current_user.rol_id == 3
      if params[:option] == 'crear_prestamo'
         libroid = params[:libro_id].to_i
         @prestamo = Prestamo.new
         @prestamo.estudiante_id = params[:estudiante_id].to_i
         @prestamo.created_by = current_user.email
         @prestamo.libro_id = libroid
         @prestamo.fechap = Time.now
         @prestamo.fechae = Time.now + 7.days
         puts @libro
         @libro = Libro.where("id = #{libroid}").first
         @libro.cantidadlibro.cantidad =   @libro.cantidadlibro.cantidad - 1
         re = ActiveRecord::Base.connection.execute("INSERT INTO prestamos(
             estudiante_id, libro_id, fechap, fechae, mora_id, 
            created_by, created_at, updated_at)
    VALUES (#{@prestamo.estudiante_id},#{libroid},'#{@prestamo.fechap}','#{@prestamo.fechae}',4,'#{@prestamo.created_by}', current_TIMESTAMP, current_TIMESTAMP)")
         res = ActiveRecord::Base.connection.execute("INSERT INTO libroprestamos(libro_id, fecha_prestamo,created_at, 
            updated_at) VALUES ('#{@libro.id}','#{Time.now}', current_TIMESTAMP,current_TIMESTAMP )")   
            @libro.save
            redirect_to :action => 'index'
         
      end 
    else
         render 'menu/noautorizado'
    end    

  end

  def edit
  end

  def update
  end

  def destroy
  end
  def devolucion
     if current_user.rol_id == 1 || current_user.rol_id == 2 || current_user.rol_id == 3
        if params[:option] == 'devolucion'
           @prestamo = Prestamo.find(params[:id])
           @libro = Libro.where("id = #{@prestamo.libro_id}").first
           @libro.cantidadlibro.cantidad =   @libro.cantidadlibro.cantidad + 1
          #@prestamo.fechad = Time.now
          #@prestamo.received_by = current_user.email
          res = ActiveRecord::Base.connection.execute("update prestamos set fechad='#{Time.now}', received_by = '#{current_user.email}' where id = #{params[:id]}")
           if params[:dias].to_i < 0
             res = ActiveRecord::Base.connection.execute("update prestamos set mora_id=5 where id = #{params[:id]}")
           end
           #if @prestamo.save
            @libro.save
            redirect_to :action => 'index' 
         #end
           

        end  
     else
        render 'menu/noautorizado'
     end
  end  

end

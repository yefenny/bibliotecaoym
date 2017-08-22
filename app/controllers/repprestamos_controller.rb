class RepprestamosController < ApplicationController
  def index
  	@buscarl = "buscar"
  	@libros = Libro.order("title").all
  end
end

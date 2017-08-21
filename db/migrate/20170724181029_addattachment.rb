class Addattachment < ActiveRecord::Migration[5.1]
  def change
  	add_attachment :libros, :document
    add_attachment :libros, :image
  end
end

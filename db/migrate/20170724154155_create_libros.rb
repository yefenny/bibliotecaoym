class CreateLibros < ActiveRecord::Migration[5.1]
  def change
    create_table :libros do |t|

      t.string :title, null: false
      t.string :author
      t.string :edition
      t.string :publicationdate
      t.string :casaeditora
      t.string :description
      t.integer :asignatura_id, null: false
      t.boolean :fisico
      t.boolean :digital
      t.timestamps
    end
  end
end

class CreateAsignaturas < ActiveRecord::Migration[5.1]
  def change
    create_table :asignaturas do |t|
	 t.string  :name
	 t.integer :areaconocimiento_id
     t.timestamps
    end
    add_index :asignaturas, :name,     unique: true
  end
end

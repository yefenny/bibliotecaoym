class CreateEstudiantes < ActiveRecord::Migration[5.1]
  def change
    create_table :estudiantes do |t|
      t.string :name,               null: false
      t.string :lastname,           null: false
      t.string :matricula,          null: false
      t.string :clave,           	null: false
      t.integer :user_id, 			null: true
      t.timestamps
    end
    add_index :estudiantes, :matricula,     unique: true
    add_index :estudiantes, :user_id, 		unique: true
  end
end

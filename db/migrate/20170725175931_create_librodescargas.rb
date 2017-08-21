class CreateLibrodescargas < ActiveRecord::Migration[5.1]
  def change
    create_table :librodescargas do |t|
      t.integer :libro_id
      t.timestamps
    end
  end
end

class CreateMoras < ActiveRecord::Migration[5.1]
  def change
    create_table :moras do |t|
      t.string :valor	
      t.timestamps
    end
  end
end

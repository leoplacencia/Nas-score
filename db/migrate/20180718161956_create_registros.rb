class CreateRegistros < ActiveRecord::Migration[5.1]
  def change
    create_table :registros do |t|
      t.string :rut
      t.date :fecha
      t.decimal :puntaje
      t.string :turno

      t.timestamps
    end
  end
end

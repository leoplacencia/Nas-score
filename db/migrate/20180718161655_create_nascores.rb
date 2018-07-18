class CreateNascores < ActiveRecord::Migration[5.1]
  def change
    create_table :nascores do |t|
      t.integer :cod
      t.string :description
      t.decimal :score
      t.string :tipo

      t.timestamps
    end
  end
end

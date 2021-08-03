class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age, limit: 3
      t.text :information
      t.string :city
      t.string :state
      t.integer :status, limit: 1,  comment: "1-Perdido, 2-Comunicado, 3-Encontrado"
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

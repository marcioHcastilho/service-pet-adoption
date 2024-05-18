class CreatePets < ActiveRecord::Migration[7.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :pet_type
      t.string :breed
      t.float :weight
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end

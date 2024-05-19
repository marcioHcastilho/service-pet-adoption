class CreateBreedInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :breed_infos do |t|
      t.string :name
      t.text :description
      t.string :life_span
      t.float :male_weight
      t.float :female_weight

      t.timestamps
    end
  end
end

class CreateSurvivors < ActiveRecord::Migration[6.0]
  def change
    create_table :survivors do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.boolean :gender, null: false
      t.integer :latitude, null: false
      t.integer :longitude, null: false
      t.integer :flag

      t.timestamps
    end
  end
end

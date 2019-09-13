class CreateSurvivors < ActiveRecord::Migration[6.0]
  def change
    create_table :survivors do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.boolean :gender, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.integer :flag, default: 0

      t.timestamps
    end
  end
end

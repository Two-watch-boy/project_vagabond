class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :photo
      t.decimal :lat
      t.decimal :lon

      t.timestamps null: false
    end
  end
end

class CreateBoroughs < ActiveRecord::Migration[5.2]
  def change
    create_table :boroughs do |t|
      t.text :name
      t.integer :income
      t.integer :economicActivity
      t.integer :health
      t.integer :crimeRate


      t.timestamps
    end
  end
end
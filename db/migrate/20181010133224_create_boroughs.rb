class CreateBoroughs < ActiveRecord::Migration[5.2]
  def change
    create_table :boroughs do |t|
      t.text :name
      t.integer :averageIncomeBorough
      t.decimal :health
      t.decimal :happiness
      t.decimal :education
      t.decimal :population
      t.text :logoLink


      t.timestamps
    end
  end
end
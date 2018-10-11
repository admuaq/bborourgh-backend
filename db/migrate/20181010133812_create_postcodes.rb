class CreatePostcodes < ActiveRecord::Migration[5.2]
  def change
    create_table :postcodes do |t|
      t.string :outcode
      t.integer :income
      t.integer :economicActivity
      t.integer :health
      t.integer :crimeRate

      t.timestamps
    end
  end
end
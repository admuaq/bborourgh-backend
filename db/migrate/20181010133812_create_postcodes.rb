class CreatePostcodes < ActiveRecord::Migration[5.2]
  def change
    create_table :postcodes do |t|
      t.string :outcode
      t.string :latitude
      t.string :longitude
      t.integer :averageSalaryPostedJob
      t.integer :crimeRate
      t.integer :houseListings

      t.timestamps
    end
  end
end
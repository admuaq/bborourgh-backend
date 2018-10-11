class CreateBoroughPostcodes < ActiveRecord::Migration[5.2]
  def change
    create_table :borough_postcodes do |t|
      t.belongs_to :borough, index: true
      t.belongs_to :postcode, index: true
      
      t.timestamps
    end
  end
end

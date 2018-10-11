class CreatePostcodes < ActiveRecord::Migration[5.2]
  def change
    create_table :postcodes do |t|
      t.belongs_to :borough, index: true
      t.string :postcode

      t.timestamps
    end
  end
end
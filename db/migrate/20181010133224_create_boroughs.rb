class CreateBoroughs < ActiveRecord::Migration[5.2]
  def change
    create_table :boroughs do |t|
      t.text :name
      t.text :towns


      t.timestamps
    end
  end
end
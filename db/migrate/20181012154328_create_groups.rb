class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :ssn
      t.string :encrypted_ssn
      t.string :encrypted_ssn_iv
      t.string :app_id
      t.string :encrypted_appid
      t.string :encrypted_appid_iv
      t.timestamps
    end
  end
end

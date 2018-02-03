class CreateEmergencia < ActiveRecord::Migration[5.1]
  def change
    create_table :emergencia do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.text :descrption
      t.string :title

      t.timestamps
    end
  end
end

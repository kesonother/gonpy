class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :street
      t.integer :zipcode
      t.float :longitude
      t.float :latitude
      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end

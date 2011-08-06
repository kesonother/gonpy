class CreateProaccounts < ActiveRecord::Migration
  def self.up
    create_table :proaccounts do |t|
      t.string :business_name
      t.timestamps
    end
  end

  def self.down
    drop_table :proaccounts
  end
end

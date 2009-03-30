class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.string        :name
      t.string        :secret_key
      t.integer       :user_id
      
      t.timestamps
    end
    add_index :sites, :user_id
  end

  def self.down
    remove_index :sites, :user_id
    drop_table :sites
  end
end

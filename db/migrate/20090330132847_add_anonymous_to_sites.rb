class AddAnonymousToSites < ActiveRecord::Migration
  def self.up
    add_column :sites, :anonymous, :boolean, :default => true
  end

  def self.down
    remove_column :sites, :anonymous
  end
end

class AddPublicToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :public, :boolean
  end

  def self.down
    remove_column :events, :public
  end
end

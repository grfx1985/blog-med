class AddAvatar1ColumnsToPosts < ActiveRecord::Migration
  def self.up
    add_attachment :posts, :avatar1
  end

  def self.down
    remove_attachment :posts, :avatar1
  end
end

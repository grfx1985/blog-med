class AddAvatar2ColumnsToPosts < ActiveRecord::Migration
   def self.up
    add_attachment :posts, :avatar2
  end

  def self.down
    remove_attachment :posts, :avatar2
  end
end

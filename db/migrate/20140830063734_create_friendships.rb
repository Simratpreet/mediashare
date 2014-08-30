class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|

      t.timestamps
      t.belongs_to :friend
      t.belongs_to :user
    end
  end
end

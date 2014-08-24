class AddUserRefToMedia < ActiveRecord::Migration
  def change
    add_reference :media, :user, index: true
  end
end

class RenameColumnInMedias < ActiveRecord::Migration
  def change
    remove_attachment :media, :image
    add_attachment :media, :attachment
  end
end

class AddApprovedToMedia < ActiveRecord::Migration
  def change
    add_column :media, :approved, :boolean, default: false
  end
end

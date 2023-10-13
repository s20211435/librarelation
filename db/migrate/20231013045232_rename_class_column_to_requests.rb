class RenameClassColumnToRequests < ActiveRecord::Migration[6.1]
  def change
    rename_column :requests, :class, :kumi
  end
end

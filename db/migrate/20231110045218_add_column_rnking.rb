class AddColumnRnking < ActiveRecord::Migration[6.1]
  def change
    add_column :rankings, :bookcover, :string
  end
end

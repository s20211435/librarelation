class CreateDealings < ActiveRecord::Migration[6.1]
  def change
    create_table :dealings do |t|
      t.string :isbn_number
      t.string :title
      t.string :author_name
      t.integer :condition

      t.timestamps
    end
  end
end

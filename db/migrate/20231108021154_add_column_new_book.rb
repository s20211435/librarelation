class AddColumnNewBook < ActiveRecord::Migration[6.1]
  def change
    add_column :new_books, :bookcover, :string
  end
end

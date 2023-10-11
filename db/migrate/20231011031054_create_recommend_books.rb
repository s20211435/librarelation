class CreateRecommendBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :recommend_books do |t|
      t.string :ISBN_number
      t.string :title
      t.string :author_name
      t.string :recommend

      t.timestamps
    end
  end
end

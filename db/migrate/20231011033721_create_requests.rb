class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.string :isbn_number
      t.string :title
      t.string :author_name
      t.string :reason
      t.string :grade
      t.string :class
      t.string :number
      t.string :name

      t.timestamps
    end
  end
end

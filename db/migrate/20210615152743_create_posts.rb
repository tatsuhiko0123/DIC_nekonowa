class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :image
      t.text :comment
      t.text :breed
      t.integer :gender
      t.integer :age
      t.integer :prefectures

      t.timestamps
    end
  end
end

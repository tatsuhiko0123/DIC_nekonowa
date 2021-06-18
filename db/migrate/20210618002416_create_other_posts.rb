class CreateOtherPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :other_posts do |t|
      t.integer :vaccination
      t.integer :operation
      t.integer :single
      t.integer :old_age
      t.text :health_status
      t.text :character
      t.text :surrender
      t.text :note
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end

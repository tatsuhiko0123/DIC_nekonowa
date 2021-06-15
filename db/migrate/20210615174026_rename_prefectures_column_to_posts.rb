class RenamePrefecturesColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :prefectures, :prefecture
  end
end

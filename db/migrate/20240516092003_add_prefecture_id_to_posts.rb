class AddPrefectureIdToPosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :prefecture, foreign_key: true
    add_reference :posts, :city, foreign_key: true
  end
end

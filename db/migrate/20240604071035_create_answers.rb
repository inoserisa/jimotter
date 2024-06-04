class CreateAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :answers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.references :prefecture, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end

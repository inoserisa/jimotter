class AddAreaIdToQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :questions, :area_id, :integer
  end
end

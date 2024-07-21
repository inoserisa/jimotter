class CreateAuthenticates < ActiveRecord::Migration[7.1]
  def change
    create_table :authenticates do |t|
      t.string :provider
      t.string :uid
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.references :post, null: false, foreign_key: { to_table: :posts }, index: true
      t.references :user, null: false, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end

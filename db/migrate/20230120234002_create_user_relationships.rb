class CreateUserRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :user_relationships do |t|
      t.references :follower, null: false, foreign_key: { to_table: :users }, index: true
      t.references :followed, null: false, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
    add_index :user_relationships, [:follower_id, :followed_id], unique: true
  end
end

class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :short_biography
      t.string :long_biography

      t.references :user, null: false, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end

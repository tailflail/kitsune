class AddSanitizedBiographiesToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :sanitized_short_biography, :string
    add_column :profiles, :sanitized_long_biography, :string
  end
end

class AddDefaultStringToProfiles < ActiveRecord::Migration[7.0]
  def change
    change_column_default :profiles, :short_biography, ''
    change_column_default :profiles, :long_biography, ''
    change_column_default :profiles, :sanitized_short_biography, ''
    change_column_default :profiles, :sanitized_long_biography, ''
  end
end

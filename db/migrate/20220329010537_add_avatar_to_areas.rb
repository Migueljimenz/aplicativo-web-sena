class AddAvatarToAreas < ActiveRecord::Migration[7.0]
  def change
    add_column :areas, :avatar, :string
  end
end

class AddAvatarUrlToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatarUrl, :string
  end
end

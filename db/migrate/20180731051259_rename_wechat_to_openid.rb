class RenameWechatToOpenid < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :wechat_id, :open_id
  end
end

json.extract! @user, :open_id, :wechat_name, :description, :avatarUrl
json.items @user.items do |item|
  json.extract! item, :open_id, :wechat_name, :description, :avatarUrl
  json.date item.created_at.strftime("%m/%d/%y")
end

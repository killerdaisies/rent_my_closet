json.extract! @user, :open_id, :wechat_name, :description
json.items @user.items do |item|
  json.extract! item, :open_id, :wechat_name, :description
  json.date item.created_at.strftime("%m/%d/%y")
end

json.extract! @user, :wechat_id, :wechat_name, :description
json.items @user.items do |item|
  json.extract! item, :wechat_id, :wechat_name, :description
  json.date item.created_at.strftime("%m/%d/%y")
end

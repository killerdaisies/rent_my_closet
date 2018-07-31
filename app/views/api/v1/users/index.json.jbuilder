json.users do
  json.array! @users do |user|
    json.extract! user, :wechat_id, :wechat_name, :description
  end
end

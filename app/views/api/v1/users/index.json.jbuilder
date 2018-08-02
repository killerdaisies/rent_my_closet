json.users do
  json.array! @users do |user|
    json.extract! user, :id, :open_id, :wechat_name, :description, :avatarUrl
  end
end

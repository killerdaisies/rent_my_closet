class User < ApplicationRecord
  has_many :items, dependent: :destroy

  validates :wechat_name, uniqueness: true, presence: true
  validates :wechat_id, uniqueness: true, presence: true
end

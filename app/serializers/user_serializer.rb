class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :email, :avatar
  has_many :favorites
  has_many :tips
  has_many :favorited_tips, through: :favorites, source: :tip
end

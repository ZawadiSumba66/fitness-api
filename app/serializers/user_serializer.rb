class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :password, :password_confirmation, :avatar
  has_many :favorites
  has_many :tips
  has_many :favorited_tips, through: :favorites, source: :tip
end

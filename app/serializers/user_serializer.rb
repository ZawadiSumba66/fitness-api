class UserSerializer < ActiveModel::Serializer
  has_many :favorites
  has_many :tips
  has_many :favorited_tips, through: :favorites, source: :tip 
end

class TipSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :benefits, :instructions, :image
  belongs_to :user
  has_many :favorites
  has_many :favoritors, through: :favorites, source: :user
end

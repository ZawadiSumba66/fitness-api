class Tip < ApplicationRecord
    has_many :favorites
    has_many :favoritors, through: :favorites, source: :user
    belongs_to :user

    validates_presence_of :name, :description, :image, :benefits, :instructions
end
class Tip < ApplicationRecord
    has_many :favorites
    belongs_to :user

    validates_presence_of :name, :description, :image, :benefits, :instructions
end
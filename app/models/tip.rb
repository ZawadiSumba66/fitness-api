class Tip < ApplicationRecord
    has_many :favorites
    has_many :favoritors, through: :favorites, source: :user
    belongs_to :user
    has_one_attached :images
    validates_presence_of :name, :description, :image, :benefits, :instructions
    def image_url(image)
        if images.attached?
          images.blob.url
        end
    end
end
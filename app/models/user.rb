class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :tips
         has_many :favorites
         has_many :favorited_tips, through: :favorites, source: :tip 
         validates :username, presence: true, uniqueness: true, length: { in: 4..20 }
         validates :email, presence: true, uniqueness: true
         validates :image, presence: true
         def generate_jwt
          JWT.encode({ id: id,
                      exp: 60.days.from_now.to_i },
                     Rails.application.secrets.secret_key_base)
        end
end

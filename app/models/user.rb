class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :tips
         has_many :favorites
         validaates :username presence: true, uniqueness: true length: { in: 4..20 }
         validates :email, presence: true, uniqueness: true
end

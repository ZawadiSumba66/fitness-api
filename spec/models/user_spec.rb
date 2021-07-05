require 'rails_helper'

RSpec.describe User, type: :model do
    it { should have_many(:tips) }
    it { should have_many(:favorites) }
    it { should have_one_attached(:avatar) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:username) }
end
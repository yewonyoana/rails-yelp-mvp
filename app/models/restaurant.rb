class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :phone_number, presence: true
  CUISINE = ['Chinese', 'Italian', 'Japanese', 'French', 'Belgian']
  validates :category, inclusion: { in: CUISINE }

end

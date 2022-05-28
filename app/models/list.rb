class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_one_attached :image_url
  validates :name, presence: true, uniqueness: true
  validates :image_url, presence: true
end

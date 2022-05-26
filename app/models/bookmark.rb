class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  # pq isso valida também como :movie e :list??
  validates :movie_id, uniqueness: { scope: :list_id }
  validates :comment, length: { minimum: 6 }
end

class Bookmark < ApplicationRecord
  validates :comment, presence: true
  validates :comment, length: { minimum: 6 }
  validates_uniqueness_of :movie, scope: :list

  belongs_to :movie
  belongs_to :list
end

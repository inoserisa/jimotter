class Prefecture < ApplicationRecord
  has_many :cities
  has_many :posts

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end

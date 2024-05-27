class Prefecture < ApplicationRecord
  has_many :cities
  has_many :posts

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end

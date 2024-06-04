class City < ApplicationRecord
  belongs_to :prefecture
  has_many :posts
  has_many :answers

  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end

class City < ApplicationRecord
  belongs_to :prefecture
  has_many :posts, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ['name']
  end
end

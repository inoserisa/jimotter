class Post < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
  belongs_to :city
  has_many :comments, dependent: :destroy

  validates :content, presence: true, length: { maximum: 200 }

  def self.ransackable_attributes(auth_object = nil)
    ["prefecture", "city", "prefecture_id", "city_id"]
  end
end

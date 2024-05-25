class Post < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
  belongs_to :city
  has_many :comments, dependent: :destroy

  validates :content, presence: true, length: { maximum: 200 }
end

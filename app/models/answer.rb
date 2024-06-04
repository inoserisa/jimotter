class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :prefecture
  belongs_to :city

  validates :content, presence: true, length: { maximum: 355 }
end

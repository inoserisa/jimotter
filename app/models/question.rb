class Question < ApplicationRecord
  belongs_to :user
  belongs_to :area, optional: true
  has_many :answers, dependent: :destroy
  has_one :notification, as: :subject, dependent: :destroy

  validates :content, presence: true, length: { maximum: 355 }
end

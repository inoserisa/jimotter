class Area < ApplicationRecord
  has_many :questions, dependent: :destroy
end

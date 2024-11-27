class Prefecture < ApplicationRecord
  has_many :cities, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  # rubocop:disable Lint/UnusedMethodArgument
  def self.ransackable_attributes(auth_object = nil)
    ['name']
  end
  # rubocop:enable Lint/UnusedMethodArgument
end

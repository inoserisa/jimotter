class User < ApplicationRecord
  acts_as_paranoid
  default_scope { where(deleted_at: nil) }

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_posts, through: :bookmarks, source: :post
  has_many :notifications, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 15 }
  validates :email, uniqueness: true
  validate :email_not_taken_by_deleted_user

  def own?(object)
    if object.is_a?(User)
      id == object.id
    else
      id == object&.user_id
    end
  end

  def bookmark(post)
    bookmarks.create(post: post)
  end

  def unbookmark(post)
    bookmarks.find_by(post: post)&.destroy
  end

  def bookmark?(post)
    bookmark_posts.include?(post)
  end

  private
  
  def email_not_taken_by_deleted_user
    if User.with_deleted.where.not(id: self.id).where(email: email).exists?
      errors.add(:email, 'は使用不可です')
    end
  end
end

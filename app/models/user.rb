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
  has_many :authenticates, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:twitter, :google_oauth2]

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, uniqueness: true
  validate :email_not_taken_by_deleted_user
  validates_acceptance_of :agreement_terms, allow_nil: false, on: :create

  def own?(object)
    if object.is_a?(User)
      id == object.id
    else
      id == object&.user_id
    end
  end

  def bookmark(post)
    bookmarks.create(post:)
  end

  def unbookmark(post)
    bookmarks.find_by(post:)&.destroy
  end

  def bookmark?(post)
    bookmark_posts.include?(post)
  end

  def self.from_omniauth(auth)
    authenticate = Authenticate.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = authenticate.user || User.where(email: auth.info.email).first_or_initialize(
      name: auth.info.name,
      email: auth.info.email
    )
    if user.persisted?
      authenticate.user = user
      authenticate.save
    end
    { user:, authenticate: }
  end

  private

  def email_not_taken_by_deleted_user
    if User.with_deleted.where.not(id: self.id).exists?(email:)
      errors.add(:email, 'は使用不可です')
    end
  end
end

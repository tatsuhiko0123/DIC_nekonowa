class User < ApplicationRecord
  before_destroy :clean_conversations
  
  mount_uploader :image, ImageUploader

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post, dependent: :destroy

  validates :name, presence: true, length: { maximum: 15 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: 'guest@guest.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.name = 'guest'
    end
  end

  def self.admin_guest
    find_or_create_by!(email: 'admin_guest@guest.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.name = 'admin_guest'
      user.admin = true
    end
  end

  def clean_conversations
    Conversation.where("(sender_id = ?) OR (recipient_id = ?)", self.id, self.id).destroy_all
  end

end

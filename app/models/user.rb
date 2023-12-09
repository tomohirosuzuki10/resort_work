class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  validate :verify_file_type
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  has_many :posts
  validates :prefecture_id, numericality: { other_than: 1}
  enum sex: { gender: 0, woman: 1 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   # is_deletedがfalseならtrueを返すようにしている
  #def active_for_authentication?
    #super && (is_valid == false)
  #end
  private

  def verify_file_type
    return unless image.attached?  # ②

    allowed_file_types = %w[image/jpg image/jpeg image/gif image/png]  # ③
    errors.add(:user_icon, 'only jpg, jpeg, gif, png') unless allowed_file_types.include?(image.blob.content_type)  # ④
  end
end
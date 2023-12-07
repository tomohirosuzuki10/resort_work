class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  validates :prefecture_id, numericality: { other_than: 1}
  enum sex: { gender: 0, woman: 1 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
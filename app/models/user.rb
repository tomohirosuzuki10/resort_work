class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum sex: { gender: 0, woman: 1 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
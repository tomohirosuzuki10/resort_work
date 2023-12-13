class Post < ApplicationRecord
     belongs_to :user
     has_many_attached :post_images
     has_many :favorites, dependent: :destroy
     def favorited_by?(user_id)
      favorites.exists?(user_id: user.id)
     end
end

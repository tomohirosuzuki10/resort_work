class AddPostPlaceToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :post_place, :string
  end
end

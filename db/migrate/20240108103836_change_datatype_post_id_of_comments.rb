class ChangeDatatypePostIdOfComments < ActiveRecord::Migration[6.1]
  def change
    change_column :comments, :post_id, :big
  end
end

class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.bigint :user_id, null: false
      t.text :post_content
      t.string :title
      t.timestamps
    end
  end
end

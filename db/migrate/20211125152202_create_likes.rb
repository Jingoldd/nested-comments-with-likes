class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end

    # Adds an index to reinforce uniqueness, avoids a user liking multiple times the same post, at db level
    add_index :likes, [:user_id, :post_id], unique: true  
  end
end

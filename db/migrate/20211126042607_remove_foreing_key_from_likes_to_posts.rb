class RemoveForeingKeyFromLikesToPosts < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :likes, :posts # Removing this fk, allows likeable_id to point to other likeable_type 
  end
end

class MakeLikesPolymorphic < ActiveRecord::Migration[6.1]
  def change
    rename_column :likes, :post_id, :likeable_id # renames post_id column as likeable_id
    add_column :likes, :likeable_type, :string # determines wich kind of object is the user liking

    remove_index :likes, [:user_id, :likeable_id] # removes the user_id and post_id index (post_id renamed in the first line)
    add_index :likes, [:user_id, :likeable_id, :likeable_type], unique: true # new index for polimorphic likes 
    add_index :likes, [:likeable_id, :likeable_type] # optional: an index to count likes of any object  
  end
end

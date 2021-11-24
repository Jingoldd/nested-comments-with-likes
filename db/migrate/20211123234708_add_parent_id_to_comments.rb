class AddParentIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :parent_id, :integer, null: true #Top level comments ("parents") should not have a parent_id
  end
end

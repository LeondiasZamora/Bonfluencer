class RemoveUniquenessFromFollows < ActiveRecord::Migration[7.1]
  def change
    remove_index :follows, column: [:follower_id, :followed_id]
    add_index :follows, [:follower_id, :followed_id]
  end
end

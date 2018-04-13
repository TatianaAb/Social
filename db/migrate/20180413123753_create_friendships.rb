class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :user
      t.integer :friend_id, foreign_key: true, source: :user
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end

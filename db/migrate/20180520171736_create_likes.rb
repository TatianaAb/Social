class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :like_status
      t.references :user
      t.integer :likeable_id
      t.string :likeable_type

      t.timestamps
    end
  end
end

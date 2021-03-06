class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment, null: false
      t.references :commenter, foreign_key: true
      t.references :post

      t.timestamps
    end
  end
end

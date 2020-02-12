class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.references :user, null: false, foreign_key: true
      # this is very neat!
      # because there is no friends table, we reference users table,
      # also, is going to look for ids in that table!
      t.references :friend, references: :users, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

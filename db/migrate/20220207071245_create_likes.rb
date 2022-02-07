class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :tweet, foreign_key: true

      t.timestamps

      t.index [:user_id, :tweet_id], unique: true
    end
  end
end

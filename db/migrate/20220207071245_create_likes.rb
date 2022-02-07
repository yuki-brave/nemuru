class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, unique: true
      t.references :tweet, unique: true

      t.timestamps
    end
  end
end

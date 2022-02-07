class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string     :title,          null: false
      t.text       :text,           null: false
      t.text       :thoughts
      t.integer    :mind_id,        null: false
      t.integer    :category_id,    null: false
      t.integer    :time_length_id, null: false
      t.references :user,           null: false, foreign_key: true

      t.timestamps
    end
  end
end

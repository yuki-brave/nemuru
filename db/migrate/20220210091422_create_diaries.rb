class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.datetime   :start_time,   	null: false
      t.string     :title,          null: false
      t.text       :text,           null: false
      t.text       :thoughts
      t.integer    :mind_id
      t.integer    :category_id
      t.integer    :time_length_id
      t.references :user,           null: false, foreign_key: true

      t.timestamps
    end
  end
end

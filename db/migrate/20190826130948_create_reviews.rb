class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating, :default => 0
      t.string :title
      t.string :comment
      t.integer :user_id
      t.integer :podcast_id

      t.timestamps
    end
  end
end

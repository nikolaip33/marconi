class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.string :title
      t.string :summary
      t.integer :number
      t.datetime :publish_date
      t.integer :length
      t.string :player_embed
      t.integer :podcast_id

      t.timestamps
    end
  end
end

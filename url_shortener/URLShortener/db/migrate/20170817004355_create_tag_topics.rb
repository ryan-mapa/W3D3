class CreateTagTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.integer :short_url_id, null: false
      t.string :topic, null: false
      t.timestamps
    end

    add_index :tags, :topic, unique: true 
  end
end

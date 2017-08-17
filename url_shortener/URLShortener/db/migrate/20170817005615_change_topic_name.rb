class ChangeTopicName < ActiveRecord::Migration[5.1]
  def change
    rename_table :tags, :tag_topics
  end
end

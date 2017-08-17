class TagTopic < ApplicationRecord

  has_many :shorts,
  primary_key: :short_url_id,
  foreign_key: :id,
  class_name: :ShortenedUrl

end

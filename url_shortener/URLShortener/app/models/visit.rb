# == Schema Information
#
# Table name: visits
#
#  id           :integer          not null, primary key
#  short_url_id :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Visit < ApplicationRecord

  def self.record_visit!(user_id, short_url_id)
    Visit.new(user_id, short_url_id)
  end

  belongs_to :visitors,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  belongs_to :visited,
  primary_key: :id,
  foreign_key: :short_url_id,
  class_name: :ShortenedUrl

end

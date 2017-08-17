# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  long_url   :string
#  short_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord
  validates :long_url, :user_id, presence: true


  def self.random_code
    short_url = SecureRandom::urlsafe_base64
    while ShortenedUrl.exists?(short_url)
      short_url = SecureRandom::urlsafe_base64
    end
    short_url
  end

  def initialize(options)
    options[:short_url] = ShortenedUrl.random_code
    super(options)
  end

  belongs_to :submitter,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  has_many :visits,
  primary_key: :id,
  foreign_key: :short_url_id,
  class_name: :Visit

  has_many :visitors,
    through: :visits,
    source: :visitors

  def num_uniques
    self.visitors.uniq {|x| x.user_id}.count
  end

  def num_clicks
    self.visits.count
  end

  def num_recent_uniques
    time = Time.now - (3600)
    self.visitors.uniq {|x| x.user_id}.select{|el| el if el.created_at >= time}.count
  end

end

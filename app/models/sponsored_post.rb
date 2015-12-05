class SponsoredPost < ActiveRecord::Base
  belongs_to :topic
  validates :title, presence: true
  validates :body, presence: true
  validates :price, presence: true
end

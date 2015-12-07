class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :sponsored_posts
  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings
end

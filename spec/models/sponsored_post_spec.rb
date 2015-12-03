require 'rails_helper'

include RandomData

RSpec.describe SponsoredPost, type: :model do
let(:sponsored_post) ( SponsoredPost.create!{title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 50} )
describe "attributes"
  it "respond to title" do
    expect(:sponsored_post).to respond_to(:title)
  end

  it "responds to body" do
    expect(:sponsored_post).to respond_to(:body)
  end

  it "responds to price" do
    expect(:sponsored_post).to respond_to(:price)
  end

end

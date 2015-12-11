require 'rails_helper'

FactoryGirl.define do
  factory :vote do
    value 1
    post
    user
  end
end

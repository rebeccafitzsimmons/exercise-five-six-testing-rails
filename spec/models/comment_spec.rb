require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "validations" do
    it{ is_expected.to validate_presence_of :user_name }
    it{ is_expected.to validate_presence_of :body }
  end
  
  it "comment has a user name" do
    idea = Idea.create!(name: "My Awesome Idea Name", description: "idea description")
    comment = Comment.create(user_name: "rails user", body: "rails is awesome")
    second_comment = Comment.create(user_name: "rails user 2", body: "again, rails is awesome")
    expect(second_comment.user_name).to eq("rails user 2")
  end
  
  it "comment has a body" do
    idea= Idea.create!(name: "My second awesome idea name", description: "second idea description")
    comment = Comment.create(user_name: "rails user 3", body: "rails is great")
    expect(comment.body).to eq("rails is great")
  end
end

require "rails_helper"
 
RSpec.describe Idea, type: :model do 
  describe "associations" do
    it{ is_expected.to have_many(:comments) }
  end
  
  describe "validations" do
    it{ is_expected.to validate_presence_of :name }
    it{ is_expected.to validate_presence_of :description }
    it{ is_expected.to validate_uniqueness_of :name }    
  end
 	
  it "has a name" do # yep, you can totally use 'it'
    idea = Idea.create!(name: "My Awesome Idea Name", description: "idea description") # creating a new idea 'instance'
    second_idea = Idea.create!(name: "My Second Idea Name", description: "second idea description") # creating another new idea 'instance'
    expect(second_idea.name).to eq("My Second Idea Name") # this is our expectation
  end
  
  it "has a description" do
  	idea = Idea.create!(name: "My third idea name", description: "My third description")
   expect(idea.description).to eq("My third description")
  end
  
  it "will not save without a name" do
    idea = Idea.new
    expect(idea).to_not be_valid
  end
  
end

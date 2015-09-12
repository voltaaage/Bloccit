require 'rails_helper'

describe Topic do
   describe "scopes" do
 
     before do 
       @public_topic = Topic.create(name: "Topic Title", description:"This is a long description that is long.") # default is public
       @private_topic = Topic.create(name: "Topic Title", description:"This is a long description that is long.",public: false)
     end
 
     describe "publicly_viewable" do
       it "returns a relation of all public topics" do
        # byebug
         expect(Topic.publicly_viewable).to include(@public_topic)
       end
     end
 
     describe "privately_viewable" do
       it "returns a relation of all private topics" do
         expect(Topic.privately_viewable).to include(@private_topic)
       end
     end
 
     describe "visible_to(user)" do
       it "returns all topics if the user is present" do
         user = true # sneaky solution; we don't need a real user, just something truthy
         expect(Topic.visible_to(user)).to eq(Topic.all)
       end
 
       it "returns only public topics if user is nil" do
         user = false
         expect(Topic.visible_to(user)).to eq(Topic.publicly_viewable)
       end
     end
   end
 end
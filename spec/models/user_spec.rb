require 'rails_helper'

describe User do 

  include TestFactories

  

  describe "#favorited(post)" do
    before do
      @post = associated_post
      @user = authenticated_user
    end

    it "returns 'nil' if the user has not favorited the post" do
      expect(@user.favorited(@post)).to be_nil
    end

    it "returns the appropriate favorite if it exists" do
      # create a new favorite with the post/user from test factories
      favorite = Favorite.create(post: @post, user: @user)

      expect(@user.favorited(@post)).to eq(favorite)
    end  

    it "returns nil if the user has favorited a different post than the post being passed into 'favorited'" do
      # create a new post and a favorite
      @post2 = associated_post(title: "new title")
      favorite = Favorite.create(post: @post2, user: @user)

      # expecting favorited to return nil when passed in the first post
      expect(@user.favorited(@post)).to be_nil
    end
  end
end
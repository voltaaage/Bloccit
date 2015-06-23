require 'rails_helper'

describe VotesController do

  include TestFactories
  include Devise::TestHelpers

  describe '#up_vote' do
    it "adds an upvote to the post" do
      request.env["HTTP_REFERER"] = '/'
      @user = authenticated_user
      @post = associated_post
      sign_in @user

      expect{
        post( :up_vote, post_id: @post.id)
      }.to change{ @post.up_votes }.by 1
    end
  end
  
end
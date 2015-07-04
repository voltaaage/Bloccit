require 'rails_helper'

describe "Visiting profiles" do

  include TestFactories

  before do
    @user = authenticated_user
    @topic = Topic.create(name: "A topic", description: "A topic")
    @post = associated_post(user: @user, topic: @topic)
    @comment = Comment.new(user: @user, post: @post, body: "A Comment")
    allow(@comment).to receive(:send_favorite_emails)
    @comment.save!
  end

  describe "not signed in" do
    it "shows profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))
      expect( page ).to have_content(@user.name)
      expect( page ).to have_content(@post.title)
      expect( page ).to have_content(@comment.body)
    end
  end

  describe "signed in" do
      before do
        #user sign in using Warden
        login_as(@user, scope: :user)
      end

      it "shows profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))
      expect( page ).to have_content(@user.name)
      expect( page ).to have_content(@post.title)
      expect( page ).to have_content(@comment.body)
    end
  end

end


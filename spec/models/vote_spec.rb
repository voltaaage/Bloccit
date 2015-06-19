require 'rails_helper'

describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        valid_upvote = Vote.create(value: 1)
        valid_downvote = Vote.create(value: -1)
        invalid_vote = Vote.create(value: 0)

        expect(valid_upvote.valid?).to eq(true)
        expect(valid_downvote.valid?).to eq(true)
        expect(invalid_vote.valid?).to eq(false)
      end
    end
  end

end
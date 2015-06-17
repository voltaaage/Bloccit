describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        upvote = Vote.new(1)
        downvote = Vote.new(-1)

        expect(vote.value).to eq(1)
        expect(downvote.value).to eq(-1)
      end
    end
  end

end
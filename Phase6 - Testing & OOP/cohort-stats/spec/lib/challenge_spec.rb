require "spec_helper"

describe Challenge do
  describe "#submittable?" do
    it "is submittable" do
      challenge = Challenge.new
      expect(challenge.submittable?).to eq(true)
    end
  end
end

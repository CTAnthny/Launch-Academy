require "spec_helper"

describe Lesson do
  let(:using_objects) { Lesson.new }

  describe "#name" do
    it "has a reader for name" do
      using_objects.name = "Using Objects"
      expect(using_objects.name).to eq("Using Objects")
    end

    it "has a writer for name" do
      expect(using_objects.name = "Using Objects").to eq("Using Objects")
    end
  end

  describe "#body" do
    it "has a reader for body" do
      using_objects.body = "Talks about objects, etc."
      expect(using_objects.body).to eq("Talks about objects, etc.")
    end

    it "has a writer for body" do
      expect(using_objects.body = "Talks about objects, etc.").to eq("Talks about objects, etc.")
    end
  end

  describe "#submittable?" do
    it "is not submittable" do
      expect(using_objects.submittable?).to eq(false)
    end
  end
end

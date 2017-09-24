require "spec_helper"

describe Video do
  let(:video_lesson) { Video.new("www.someplace.com") }

  describe "#url" do
    it "has a reader for url" do
      expect(video_lesson.url).to eq("www.someplace.com")
    end

    it "does not have a writer for url" do
      expect { video_lesson.url = "www.someurl.com" }.to raise_error(NoMethodError)
    end
  end
end

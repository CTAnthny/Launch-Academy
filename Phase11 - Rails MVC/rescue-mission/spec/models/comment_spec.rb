require 'rails_helper'

RSpec.describe Comment do
  it { should validate_presence_of(:commenter) }
  it { should validate_presence_of(:body) }
end

require 'rails_helper'

feature "user views answers for question" do
  before :each do
    @question = FactoryGirl.create(:question)
    oldest_comment = FactoryGirl.create(:comment, question: @question, created_at: "2015-07-01")
    newest_comment = FactoryGirl.create(:comment, question: @question, created_at: "2015-09-01")
  end

  # As a user
  # I want to view the answers for a question
  # So that I can learn from the answer
  #
  # Acceptance Criteria
  #
  # - I must be on the question detail page
  # - I must only see answers to the question I'm viewing
  # - I must see all answers listed in order, most recent last

  scenario "user views question page and sees its answers" do
    visit question_path(@question)
    expect(page).to have_content("Bill Gates")
    expect(page).to have_content("Created: 2015-07-01")
  end

  scenario "user views question answers in most recent order" do
    visit question_path(@question)
    content = first('.created_at').text
    expect(content).to eq("Created: 2015-09-01 00:00:00 UTC")
  end
end

require 'rails_helper'

feature "view all questions" do
  before :each do
    Question.create!(title: "How to use google", body: "so lost")
  end

  # As a user
  # I want to view recently posted questions
  # So that I can help others
  #
  # Acceptance Criteria
  #
  # - I must see the title of each question
  # - I must see questions listed in order, most recently posted first

  scenario "user views posted questions from root path" do
    visit root_path
    expect(page).to have_content("How to use google")
  end

  scenario "user views posted questions from /questions" do
    visit questions_path
    expect(page).to have_content("How to use google")
  end

  scenario "user views most recent post first" do
    Question.create!(title: "How to make good brussels sprouts", body: "what do I do")
    visit questions_path
    content = first('li').text
    expect(content).to eq("How to use google")
  end
end

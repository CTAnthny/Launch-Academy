require 'rails_helper'

feature "view question details" do
  before :each do
    @question = Question.create!(title: "How to use google", body: "so lost")
  end
 
  # As a user
  # I want to view a question's details
  # So that I can effectively understand the question
  #
  # Acceptance Criteria
  #
  # - I must be able to get to this page from the questions index
  # - I must see the question's title
  # - I must see the question's description

  scenario "user visits question show page from root path" do
    Question.create!(title: "How to make good brussels sprouts", body: "what do I do")
    visit root_path
    click_link("How to use google")
    expect(page).to have_content("How to use google")
    expect(page).not_to have_content("How to make good brussels sprouts")
  end

  scenario "user visits question show page from /questions" do
    visit question_path(@question)
    expect(page).to have_content("How to use google")
  end

  scenario "question show page has title and description" do
    visit question_path(@question)
    expect(page).to have_content("How to use google")
    expect(page).to have_content("so lost")
  end
end

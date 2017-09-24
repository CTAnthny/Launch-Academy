require 'rails_helper'

feature "user answers question" do
  before :each do
    @question = Question.create!(title: "How to use google", body: "so lost")
  end

  # As a user
  # I want to answer another user's question
  # So that I can help them solve their problem
  #
  # Acceptance Criteria
  #
  # - I must be on the question detail page
  # - I must provide a description that is at least 50 characters long
  # - I must be presented with errors if I fill out the form incorrectly

  scenario "user visits question page and responds" do
    visit question_path(@question)
    fill_in "Commenter", with: "Bill Gates"
    fill_in "Body", with: "Go to google.com"
    click_button "Answer Question"
    expect(page).to have_content("Your answer was successfully posted!")
    expect(page).to have_content("Bill Gates")
    expect(page).to have_content("Go to google.com")
  end

  context "question validation" do
    before(:each) do
      visit question_path(@question)
      fill_in "Commenter", with: ""
      fill_in "Body", with: ""
      click_button "Answer Question"
    end

    scenario "question meets validation requirements" do
      expect(page).to_not have_content("Your answer was successfully posted!")
    end

    scenario "user is presented with errors when validation fails" do
      expect(page).to have_content "Commenter can't be blank"
      expect(page).to have_content "Body can't be blank"
    end
  end
end

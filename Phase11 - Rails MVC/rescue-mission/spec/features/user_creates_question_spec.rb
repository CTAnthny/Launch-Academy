require 'rails_helper'

feature "user posts question" do

  # As a user
  # I want to post a question
  # So that I can receive help from others
  #
  # Acceptance Criteria
  #
  # - I must provide a title that is at least 40 characters long
  # - I must provide a description that is at least 150 characters long
  # - I must be presented with errors if I fill out the form incorrectly

  scenario "user posts a new question" do
    visit root_path
    click_button("New Question")
    fill_in "Title", with: "How to use google"
    fill_in "question_body", with: "I'm so lost"
    click_button("Create Question")
    expect(page).to have_content "Your question has been posted!"
  end

  context "question validation" do
    before(:each) do
      visit new_question_path
      fill_in "Title", with: ""
      fill_in "question_body", with: ""
      click_button("Create Question")
    end

    scenario "question meets validation requirements" do
      expect(page).to_not have_content "Your question has been posted!"
    end

    scenario "user is presented with errors when validation fails" do
      expect(page).to have_content "Title can't be blank"
      expect(page).to have_content "Body can't be blank"
    end
  end
end

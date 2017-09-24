require 'rails_helper'

feature "user edits question" do
  before(:each) do
    @question = FactoryGirl.create(:question)
    visit question_path(@question)
    click_link("Edit")
  end

# As a user
# I want to edit a question
# So that I can correct any mistakes or add updates
#
# Acceptance Criteria
#
# - I must provide valid information
# - I must be presented with errors if I fill out the form incorrectly
# - I must be able to get to the edit page from the question details page

  scenario "user selects question and is presented with an edit form" do
    expect(page).to have_field("Title")
    expect(page).to have_field("question_body")
  end

  scenario "user is presented with errors when validation fails" do
    fill_in "Title", with: ""
    fill_in "question_body", with: ""
    click_button "Update Question"
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end

  scenario "user selects question and can update its information" do
    fill_in "Title", with: "How to use duck-duck-go"
    fill_in "question_body", with: "Really need some help"
    click_button "Update Question"
    expect(page).to have_current_path(question_path(@question))
    expect(page).to have_content("Your question has been updated!")
    expect(page).to have_content("How to use duck-duck-go")
    expect(page).to have_content("Really need some help")
  end
end

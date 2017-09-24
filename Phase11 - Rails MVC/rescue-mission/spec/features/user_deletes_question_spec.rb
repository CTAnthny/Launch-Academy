require 'rails_helper'

feature "user deletes a question" do
  before(:each) do
    @question = FactoryGirl.create(:question)
    visit question_path(@question)
  end

  # As a user
  # I want to delete a question
  # So that I can delete duplicate questions
  #
  # Acceptance Criteria
  #
  # - I must be able delete a question from the question edit page
  # - I must be able delete a question from the question details page
  # - All answers associated with the question must also be deleted

  scenario "user deletes question from edit page" do
    click_link "Edit"
    click_link "Delete"
    expect(page).to have_current_path(questions_path)
    expect(page).to have_content("Question has been deleted!")
    expect(page).to_not have_content("How to google")
  end

  scenario "user deletes question from details page" do
    click_link "Delete"
    expect(page).to have_current_path(questions_path)
    expect(page).to have_content("Question has been deleted!")
    expect(page).to_not have_content("How to google")
  end

  scenario "comments/answers are deleted when question is" do
    expect(@question.comments).to eq([])
  end
end

require_relative "spec_helper"

feature "User competes in rock-paper-scissors against AI", %(

  As a user,
  [ ] When I first visit the app a new game is started
  [ ] I can choose one of three options (r,p,s) by form submit
  [ ] When my choice is submitted, AI randomly chooses and options
      - winner receives a point
      - if there is a tie, no point is awarded
  [ ] Refreshing the page should not re-submit a choice
  [ ] Best of three wins
  [ ] After beginning there is a restart option
  [ ] Multiple games, simultaneously are possible

) do

  scenario "user starts a new game on initial visit" do
  end

  context "user can choose one of three options (r,p,s)" do
    scenario "user is able to choose rock" do
      visit '/'
      click_button 'Rock'

      expect(page).to have_text("Player rolled rock")
    end

    scenario "user is able to choose paper" do
      visit '/'
      click_button 'Paper'

      expect(page).to have_text("Player rolled paper")
    end

    scenario "user is able to choose scissors" do
      visit '/'
      click_button 'Scissors'

      expect(page).to have_text("Player rolled scissors")
    end
  end
end

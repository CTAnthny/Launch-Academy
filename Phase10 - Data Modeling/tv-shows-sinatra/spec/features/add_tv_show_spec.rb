require "spec_helper"

feature "user adds a new TV show" do
  # As a TV fanatic
  # I want to add one of my favorite shows
  # So that I can encourage others to binge watch it
  #
  # Acceptance Criteria:
  # * I must provide the title, network, and starting year.
  # * I can optionally provide the final year, genre, and synopsis.

  scenario "successfully add a new show" do
    visit "/television_shows/new"

    within("#new_tv_form") do
      fill_in 'Title', :with => 'Game of Thrones'
      fill_in 'Network', :with => 'HBO'
      fill_in 'Starting Year', :with => 2011
      select 'Fantasy', :from => 'Genre'
    end
    click_button('Add TV Show')

    visit "/television_shows"
    expect(page).to have_content("Game of Thrones (HBO)")
  end

  # * The synopsis can be no longer than 5000 characters.
  # * The starting year and ending year (if provided) must be
  #   greater than 1900.
  # * The genre must be one of the following: Action, Mystery,
  #   Drama, Comedy, Fantasy
  # * If any of the above validations fail, the form should be
  #   re-displayed with the failing validation message.

  scenario "fail to add a show with invalid information" do
    visit "/television_shows/new"

    within("#new_tv_form") do
      fill_in 'Title', :with => 'Game of Thrones'
      fill_in 'Network', :with => 'HBO'
      fill_in 'Starting Year', :with => 1899
      select 'Fantasy', :from => 'Genre'
    end
    click_button('Add TV Show')

    expect(page).to have_content("error")
  end
end

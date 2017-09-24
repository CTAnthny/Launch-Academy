require 'spec_helper'

# As a user
# I want to create a meetup
# So that I can gather a group of people to do an activity
# Acceptance Criteria:
#
# There should be a link from the meetups index page that takes you to the meetups new page.
# On this page there is a form to create a new meetup.
# I must be signed in, and I must supply a name, location, and description.
# If the form submission is successful, I should be brought to the meetup's show page, and I should see a message that lets me know that I have created a meetup successfully.
# If the form submission is unsuccessful, I should remain on the meetups new page,
# and I should see error messages explaining why the form submission was unsuccessful.
# The form should be pre-filled with the values that were provided when the form was submitted.

feature 'user creates a meetup group' do
  let(:user) do
    User.create(
      provider: "github",
      uid: "1",
      username: "jarlax1",
      email: "jarlax1@launchacademy.com",
      avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
    )
  end

  before :each do
    visit '/'
    sign_in_as user
  end

  scenario 'successfully create a meetup group' do
    visit '/meetups/new'

    within("#new_meetup_form") do
      fill_in 'Title', :with => 'Rubyists'
      fill_in 'Description', :with => 'People who program or are interested in the Ruby programming language. Some days we will write code and or tests, and some days we might even veer off into other programming concepts.'
      select 'Tech', :from => 'Category'
      select 'the Moon', :from => 'Location'
    end
    click_button('Create Meetup!')

    visit '/meetups'
    expect(page).to have_content('Rubyists')
  end
end

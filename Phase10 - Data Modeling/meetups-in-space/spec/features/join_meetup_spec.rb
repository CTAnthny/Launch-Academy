require 'spec_helper'
require 'pry'

feature 'user joins meetup' do
  let(:user) do
    User.create(
      provider: "github",
      uid: "2",
      username: "jarlax2",
      email: "jarlax2@launchacademy.com",
      avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
    )
  end

  before :each do
    visit '/'
    sign_in_as user

    @rubyists = Meetup.create({
      title: 'Rubyists', creator: user,
      category: 'Tech', location: 'the Moon',
      description: 'People who program or are interested in the Ruby programming language. Some days we will write code and or tests, and some days we might even veer off into other programming concepts.'
    })
  end

# As a user
# I want to join a meetup
# So that I can partake in this meetup
# Acceptance Criteria:
#
# # On a meetup's show page, there should be a button to join the meetup if I am not signed in or
# if I am signed in, but I am not a member of the meetup.
# # If I am signed in and I click the button, I should see a message that says that I have joined
#  the meetup and I should be added to the meetup's members list.
# # If I am not signed in and I click the button,
# I should see a message which says that I must sign in.

  scenario 'user is not signed in and tries to join meetup' do
    visit '/'
    click_link "Sign Out"
    visit "/meetups/#{@rubyists.id}"
    click_link('Join this meetup!')
    expect(page).to have_content('You must sign in first to join this meetup!')
  end

  scenario 'user is signed in and tries to join meetup' do
    visit "/meetups/#{@rubyists.id}"
    click_link('Join this meetup!')
    expect(page).to have_content('You have successfully joined this meetup!')
    expect(page).to have_content('jarlax2')
  end

  scenario 'user is signed in and is already a member of meetup' do
    # add user to members
    Registration.create(user_id: user.id, meetup_id: @rubyists.id)
    visit "/meetups/#{@rubyists.id}"
    expect(page).to_not have_selector(:link_or_button, 'Join this meetup!')
  end
end

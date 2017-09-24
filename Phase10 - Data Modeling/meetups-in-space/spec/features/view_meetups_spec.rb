require 'spec_helper'

feature 'user views meetups' do
  let(:user) do
    User.create(
      provider: "github",
      uid: "1",
      username: "jarlax1",
      email: "jarlax1@launchacademy.com",
      avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
    )
  end
  let(:user2) do
    User.create(
      provider: "github",
      uid: "2",
      username: "wookieface01",
      email: "wookieface01@launchacademy.com",
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

    Registration.create(user_id: user2.id, meetup_id: @rubyists.id)
  end

# As a user
# I want to view a list of all available meetups
# So that I can get together with people with similar interests
#
# Acceptance Criteria:
#
# On the meetups index page, I should see the name of each meetup.
# Meetups should be listed alphabetically.

  scenario "view list of all meetups" do
    outdoorsy = Meetup.create!({
      title: 'Outdoor Enthusiasts', creator: user,
      # members: 'chupchup21 dfalck',
      category: 'Adventure', location: 'Titan',
      description: 'People who like being outdoors and going on interesting adventures! We organize hikes, bike rides, river trips, etc.'
    })

    visit '/meetups'

    expect(page).to have_content("Rubyists")
    expect(page).to have_content("Outdoor Enthusiasts")
  end

# As a user
# I want to view the details of a meetup
# So that I can learn more about its purpose
#
# Acceptance Criteria:
#
# On the index page, the name of each meetup should be a link to the meetup's show page.
# On the show page, I should see the name, description, location, and the creator of the meetup

  scenario "view details of a meetup" do
    visit '/meetups'
    click_link('Rubyists')
    expect(page).to have_content('Creator:')
    expect(page).to have_content('Description:')
    expect(page).to have_content('Location:')
    expect(page).to have_content('Members:')
  end

# As a user
# I want to see who has already joined a meetup
# So that I can see if any of my friends have joined

# Acceptance Criteria:
#
# On a meetup's show page, I should see a list of the members that have joined the meetup.
# I should see each member's avatar and username.

 scenario "view meetup members" do
   @rubyists.users << user2
   visit "/meetups/#{@rubyists.id}"
   expect(page).to have_content('wookieface01')
   expect(page).to have_content("#{user2.avatar_url}")
 end
end

require "spec_helper"

feature "user deletes grocery item", js: true do

  scenario "successfully add grocery item" do
    visit "/groceries"
    fill_in "Name", with: "Asparagus"

    expect_no_page_reload do
      click_button "Add"
      expect(page).to have_content "Asparagus"
    end
  end

  scenario "successfully delete grocery item" do
    visit "/groceries"

    expect_no_page_reload do
      all('#delete_grocery_item').last.click_button("Delete")
      expect(page).to_not have_content "Asparagus"
    end
  end
end

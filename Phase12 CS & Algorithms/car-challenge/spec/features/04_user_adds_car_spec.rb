require 'rails_helper'

feature 'user adds car', %{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
} do

  #[] I must specify the manufacturer, color, year, and mileage of the car (an association between the car and an existing manufacturer should be created).
  #[] Only years from 1920 and above can be specified.
  #[] I can optionally specify a description of the car.
  #[] If I enter all of the required information in the required formats, the car is recorded and I am presented with a notification of success.
  #[] If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
  #[] Upon successfully creating a car, I am redirected back to the index of cars.

  let!(:manufacturer_1) { FactoryGirl.create(:manufacturer) }
  let!(:manufacturer_2) { FactoryGirl.create(:manufacturer) }

  scenario 'user successfully adds car with valid input' do
    visit new_car_path

    select manufacturer_2.name, from: 'Manufacturer'
    fill_in 'Name', with: 'Camry'
    fill_in 'Color', with: 'Black'
    fill_in 'Year', with: '2015'
    fill_in 'Mileage', with: '1000'
    fill_in 'Description', with: 'My very first car'
    click_button 'Add Car'

    expect(page).to have_content('Car added successfully!')
    expect(page).to have_content('My very first car')
  end

  scenario 'user enters invalid inputs for car and sees errors' do
    visit new_car_path

    select manufacturer_2.name, from: 'Manufacturer'
    fill_in 'Name', with: 'Camry'
    fill_in 'Color', with: 'Black'
    fill_in 'Year', with: '1899'
    fill_in 'Mileage', with: ''
    click_button 'Add Car'

    expect(page).to_not have_content('Car added successfully!')

    expect(page).to have_content('Year only allows greater than 1900')
    expect(page).to have_content("Mileage can't be blank")
  end
end

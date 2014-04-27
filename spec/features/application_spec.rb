require 'spec_helper'
require 'capybara/rspec'

Capybara.app = Application

feature 'Shoes' do
  scenario 'User can add a shoe name and size' do
    visit '/'

    click_link 'Add Shoes'
    fill_in 'name', with: 'Nike'
    fill_in 'size', with: '8'
    click_on 'Add Shoe'

    expect(page).to have_content 'Nike'
    expect(page).to have_content '8'
  end
end
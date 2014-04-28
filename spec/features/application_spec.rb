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

  scenario 'User can display one style of shoe' do
    visit '/'
    click_link 'Add Shoes'
    fill_in 'name', with: 'Nike'
    fill_in 'size', with: '8'
    click_on 'Add Shoe'

    click_link 'Nike'

    expect(page).to have_content 'Nike'
    expect(page).to have_content '8'
  end

  scenario 'User can update shoe details' do
    visit '/'
    click_link 'Add Shoes'
    fill_in 'name', with: 'Adidas'
    fill_in 'size', with: '12'
    click_on 'Add Shoe'
    click_link 'Adidas'

    click_link 'Edit'
    fill_in 'name', with: 'Toms'
    fill_in 'size', with: '7'
    click_on 'Update Shoe'

    expect(page).to have_content 'Toms'
    expect(page).to have_content '7'

    expect(page).to have_no_content 'Adidas'
    expect(page).to have_no_content '12'
  end

  scenario 'User can delete shoes' do
    visit '/'
    click_link 'Add Shoes'
    fill_in 'name', with: 'Adidas'
    fill_in 'size', with: '12'
    click_on 'Add Shoe'
    click_link 'Adidas'

    click_on 'Delete'


    expect(page).to have_content 'I Heart Shoes!  '

    expect(page).to have_no_content 'Adidas'
    expect(page).to have_no_content '12'
  end
end
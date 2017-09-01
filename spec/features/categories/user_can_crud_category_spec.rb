require 'rails_helper'

RSpec.feature "As a user" do
  scenario "I can see the index of all categories" do
    visit '/categories'
    
    expect(page).to have_content("Index")
  end
  
  scenario "I can create a new category" do
    visit '/categories/new'
    
    fill_in('Title:', with: "Food Service")
    save_and_open_page
    click_on('Submit')
    expect(current_path).to eq(categories_path)
    expect(page).to have_content('Food Service')
  end
end
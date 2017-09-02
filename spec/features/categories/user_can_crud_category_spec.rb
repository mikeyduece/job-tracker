require 'rails_helper'

RSpec.feature "User" do
  scenario "can see the index of all categories" do
    visit '/categories'
    
    expect(page).to have_content("Index")
  end
  
  scenario "can create a new category" do
    visit '/categories/new'
    
    fill_in('Title:', with: "Food Service")
    click_on('Submit')
    expect(page).to have_content('Food Service')
  end
  
  scenario "can't create duplicate category title" do
    category = Category.create!(title: 'Food Service')
    category.jobs = create_list(:job, 3)
    
    visit '/categories/new'
    fill_in('Title:', with: "Food Service")
    click_on('Submit')
    within("h1") do
      expect(page).to have_content('New Category')
    end
  end
  
  scenario "can edit existing category" do
    category = create(:category)
    category.jobs = create_list(:job, 3)
    old_title = category.title

    visit edit_category_path(category)
    fill_in('Title:', with: "Dev")
    click_on('Submit')
    
    expect(page).to have_content('Dev')
    expect(page).to_not have_content(old_title)
  end
  
  scenario "can delete category record" do
    create_list(:category, 5)
    visit categories_path
    expect(Category.count).to eq(5)
    click_link("Delete", :match => :first)

    expect(Category.count).to eq(4)
  end
  
  scenario "can create new category from new job form" do
    company = create(:company)
    category = create(:category)
    
    visit new_company_job_path(company)
    click_on('New Category')
    
    expect(current_path).to eq(new_category_path)
  end
end
require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    company = Company.create!(name: "ESPN")
    category = create_list(:category, 5).last
    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    select category.title, from: 'job[category_id]'

    click_button "Create"

    expect(current_path).to eq(company_path(company))
    expect(page).to have_content("Developer")
  end
  
end

require 'rails_helper'

RSpec.feature "A User can" do
  scenario "delete a record for a job" do
    company = create(:company)
    job_1, job_2, job_3 = create_list(:job, 3)
    expect(Job.count).to eq(3)
    visit company_job_path(company, job_1)
    click_on('Delete Job Record')
    
    expect(Job.count).to eq(2)
  end
  
  scenario "edit an existing job record" do
    job = create(:job)
    visit company_job_path(Company.first, job)
    click_on("Edit Job Record")
    
    expect(current_path).to eq(edit_company_job_path(Company.first, job))
    
    fill_in('Title:', with: "Engi")
    fill_in('Desc:', with: 'Goblin')
    fill_in('LoI:', with: 75)
    fill_in('City:', with: "Denver")
    click_on('Submit')
    
    expect(page).to have_content("Engi")
    expect(page).to have_content("Goblin")
  end
end
require 'rails_helper'

RSpec.feature "A User can" do
  scenario "delete a record for a job" do
    company = create(:company)
    company.jobs = create_list(:job, 3)

    expect(company.jobs.count).to eq(3)
    
    visit company_job_path(company, company.jobs.first)
    click_on('Delete', match: :first)
    
    expect { click_link 'Delete' }.to change(company.jobs, :count).by(-1)
  end
  
  scenario "edit an existing job record" do
    job = create(:job)
    visit edit_company_job_path(job.company, job)
    
    fill_in('Title:', with: "Engi")
    fill_in('Desc:', with: 'Goblin')
    fill_in('LoI:', with: 75)
    fill_in('City:', with: "Denver")
    click_on('Submit')
    
    expect(page).to have_content("Engi")
    expect(page).to have_content("Goblin")
    expect(page).to have_content(75)
    expect(page).to have_content("Denver")
  end
end
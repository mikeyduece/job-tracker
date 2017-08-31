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
end
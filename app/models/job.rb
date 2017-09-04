class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category, optional: true
  has_many :comments
  
  def self.company_jobs_index
    Company.find(job.company_id).jobs
  end
end

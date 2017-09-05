class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category, optional: true
  has_many :comments
  
  def self.company_jobs_index
    Company.find(:company_id).jobs
  end
  
  def self.sort(params)
    if params == 'location'
      order(:city)
    elsif params == 'interest'
      order(:level_of_interest).reverse
    end
  end
  
  def self.level_count
    group(:level_of_interest).order('level_of_interest DESC').count
  end
  
  def self.by_city(params)
    where(city: params)
  end  
  
end

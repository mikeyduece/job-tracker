class Contact < ApplicationRecord
  validates :company_id, presence: true
  validates :full_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  belongs_to :company
end

class Comment < ApplicationRecord
  belongs_to :job
  
  def created
    Date.strptime(self.created_at.to_s, "%Y-%m-%d %H:%M:%S %Z")
  end
  
  def updated
    Date.strptime(self.updated_at.to_s, "%Y-%m-%d %H:%M:%S %Z")
  end
end

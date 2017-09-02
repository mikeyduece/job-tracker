class Comment < ApplicationRecord
  belongs_to :job
  
  def created
    self.created_at.strftime("%F %H:%M")
  end
  
  def updated
    self.updated_at.strftime("%F %H:%M")
  end
end

FactoryGirl.define do
  
  factory :company do
    sequence :name do |n|
      "#{n}Company"
    end
  end
  
  
  factory :job do
    sequence :title do |n|
      "#{n}JobTitle"
    end
    description "Job description"
    sequence :level_of_interest do |i|
      i
    end
    city "Denver"
    company
    category
  end
  
  factory :category do
    sequence :title do |n|
      "#{n}MyString"
    end
  end
  
  # factory :comment do
  #   sequence :body do |n|
  #     "Test Comment#{n}"
  #   end
  # end
end








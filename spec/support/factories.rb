FactoryGirl.define do
  
  factory :company do
    sequence :name do |n|
      "#{n}Company"
    end
  
  end
    
  factory :job do
    title "Job title"
    description "Job description"
    sequence :level_of_interest do |i|
      i
    end
    city "Denver"
    company
  end
  
  factory :category do
    sequence :title do |n|
      title "#{n}MyString"
    end
  end
end
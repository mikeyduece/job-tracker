FactoryGirl.define do
  
  factory :company do
    sequence :name do |n|
      "#{n}Comany"
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
end
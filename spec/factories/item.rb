FactoryGirl.define do
  factory :item do
    association :list

    name 'Buy that thing'
    done false
  end
end

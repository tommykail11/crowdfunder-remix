FactoryGirl.define do
  factory :pledge do
    amount 100
    user
    project
  end
end
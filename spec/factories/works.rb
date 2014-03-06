# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :work do
    mark 1
    description "MyString"
    video nil
    user nil
  end
end

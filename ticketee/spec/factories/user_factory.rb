FactoryGirl.define do
  #Creates user1/user2/user3...@example.com
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    name "example_user"
    email { generate(:email) }
    password "beepboop"
    password_confirmation "beepboop" 

    factory :admin_user do
      admin true
    end
  end
end

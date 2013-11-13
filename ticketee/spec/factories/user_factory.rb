FactoryGirl.define do
  factory :user do
    name "example_user"
    email "sample@example.com"
    password "beepboop"
    password_confirmation "beepboop" 

    factory :admin_user do
      admin true
    end
  end
end

FactoryBot.define do
  factory :comment, class: Comment do
    auther "MyString"
    body "MyText"

    trait :with_article do
      association :article, factory: :article
    end
  end
end

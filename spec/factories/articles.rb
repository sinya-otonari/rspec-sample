FactoryBot.define do
  factory :article do
    title "遅延評価について"
    body { "#{title}の記事です" }
    status :draft

    trait :published do
      status :published
    end

    trait :long_title do
      title 'とても長いタイトルをもった記事を作る属性'
    end

    trait :test_callback do
      #after(:create) do
      before(:create) do
        p 'コールバックのテスト'
      end
    end

    trait :with_comments do
      transient do
        comments_count 5
      end

      after(:create) do |article, evaluator|
        create_list(:comment, evaluator.comments_count, article: article)
      end
    end
  end
end

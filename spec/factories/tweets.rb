FactoryBot.define do 
  factory :tweet do 
    Faker::Config.locale = 'en-US'
    text { Faker::Lorem.sentence }
    created_at { DateTime.now }
    edit_history_tweet_ids { [Faker::Number.number(digits: 19)] }
    lang { "en" }
  end 

end 
FactoryBot.define do
  
  factory :sns_credential do
    provider { "1234567812345678" }
    uid { "facebook" }
    user { nil }
  end
end

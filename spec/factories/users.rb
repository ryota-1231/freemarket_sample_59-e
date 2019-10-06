FactoryBot.define do

  factory :user do
    nickname                   {"taro"}
    email                      {"vvv@gmail.com"}
    password                   {"12345678"}
    password_confirmation      {"12345678"}
    last_name                  {"山田"}
    first_name                 {"翔太"}
    last_name_kana             {"ヤマダ"}
    first_name_kana            {"ショウタ"}
    birthdate_year             {"2000"}
    birthdate_month            {"12"}
    birthdate_day              {"12"}
    address_last_name          {"山田"}
    address_first_name         {"翔太"}
    address_last_name_kana     {"ヤマダ"}
    address_first_name_kana    {"ショウタ"}
    card_number                {"1234567812345678"}
    expiration_year            {"2020"}
    expiration_month           {"12"}
    cellphone_number           {"08012345678"}
  end

end
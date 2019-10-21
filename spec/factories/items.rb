FactoryBot.define do

  factory :item do
    title           {"sample"}
    explanation     {"explanation"}
    price           {"10000"}
    postage         {"600"}
    user_id         {"1"}
    category_id     {"1"}
    brand_id        {"1"}
    seller_id       {"1"}
    buyer_id        {"1"}
    delivery_id     {"1"}
    status_id       {"1"}
    sizetype_id     {"1"}
    purchase        {"exhibiting"}
  end

end
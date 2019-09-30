

100.times do
  item = Item.new(
    title: Faker::Food.fruits,
    explanation: Faker::Food.dish,
    price: Faker::Number.within(range: 300..10000),
    state: Faker::Creature::Animal.name , 
    postage: Faker::Number.within(range: 300..800),
    user_id: 1, 
    category_id: 1,
  )
  item.save!
end


require "csv"

CSV.foreach('db/sizetypes.csv', headers: true) do |row|
  Sizetype.create(
    sizetype: row['sizetype'],
    created_at: row['created_at'],
    updated_at: row['updated_at'],
    ancestry: row['ancestry']
  )
end

CSV.foreach('db/brands.csv', headers: true) do |row|
  Brand.create(
    name: row['name'],
    created_at: row['created_at'],
    updated_at: row['updated_at'],
    )
end

CSV.foreach('db/categories.csv', headers: true) do |row|
  Category.create(
    id: row['id'],
    name: row['name'],
    created_at: row['created_at'],
    updated_at: row['updated_at'],
    ancestry: row['ancestry'],
    sizetype_id: row['sizetype_id']
  )
end

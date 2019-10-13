require 'mechanize'

  agent = Mechanize.new

  # カテゴリーの保存
  # current_page = agent.get("https://www.mercari.com/jp/category/")
  # parents = current_page.search('.category-list-individual-box')
  # categories = {}

  # parents.each do |parent|
  #   parent_name = parent.at('h3').inner_text
  #   categories[parent_name] = {}
  #   children = parent.search('.category-list-individual-box-sub-category-name')
  #   grandchildren = parent.search('.category-list-individual-box-sub-sub-category-box')
  #   container = children.zip(grandchildren)

  #   container.each do |content|
  #     child_name = content[0].at('h4').inner_text
  #     next if child_name=="すべて"
  #     categories[parent_name][child_name] = []

  #     content[1].search('.category-list-individual-box-sub-sub-category-name').each do |grandchild|
  #       grandchild_name = grandchild.at('p a').inner_text.strip
  #       next if grandchild_name=="すべて"
  #       categories[parent_name][child_name] << grandchild_name
  #     end
  #   end
  # end

  # categories.keys.each do |parent_name|
  #   parent = Category.create(name: parent_name) 
  #   categories[parent_name].keys.each do |children_name|
  #     child = parent.children.create(name: children_name)
  #     categories[parent_name][children_name].each do |grandchild_name|
  #       child.children.create(name: grandchild_name)  
  #     end
  #   end
  # end

# ブランドの保存
  # for i in 1..17 do
  #   if i==9 
  #     next
  #   else
  #     current_page = agent.get("https://www.mercari.com/jp/brand/?brand_group_id=#{i}")
  #     brands_group = current_page.search('.brand-list-box')
  #     parent_name = brands_group.at('h3').inner_text.strip
  #     brands = {}
  #     brands[parent_name] = {}
  #     children = brands_group.search('.brand-list-initial-box')
  #     children.each do |child|
  #       child_name = child.at('h4').inner_text.strip
  #       brands[parent_name][child_name] = []
  #       child.search('p').each do |grandchild|
  #         grandchild_name = grandchild.inner_text.strip
  #         brands[parent_name][child_name] << grandchild_name
  #       end
  #     end

  #     brands.keys.each do |parent_name|
  #       parent = Brand.create(name: parent_name) 
  #       brands[parent_name].keys.each do |children_name|
  #         child = parent.children.create(name: children_name)
  #         brands[parent_name][children_name].each do |grandchild_name|
  #           child.children.create(name: grandchild_name)  
  #         end
  #       end
  #     end
  #   end
  # end



# 100.times do
#   item = Item.new(
#     title: Faker::Food.fruits,
#     explanation: Faker::Food.dish,
#     price: Faker::Number.within(range: 300..10000),
#     status_id: Faker::Number.within(range: 1..6), 
#     postage: Faker::Number.within(range: 300..800),
#     user_id: 1,
#     delivery_id: Faker::Number.within(range: 1..100),
#     brand_id: Faker::Number.within(range: 1..15249),
#     category_id: Faker::Number.within(range: 1..1325),
#     sizetype_id: Faker::Number.within(range: 1..144),
#     purchase: Faker::Number.within(range: 0..1)
#   )
#   item.save!
# end

# 100.times do
#   delivery = Delivery.new(
#     deliveryfee_id: Faker::Number.within(range: 1..2),
#     deliverymethod_id: Faker::Number.within(range: 1..10),
#     deliverysource_id: Faker::Number.within(range: 1..47),
#     deliverydate_id: Faker::Number.within(range: 1..3)
#   )
#   delivery.save!
# end


# image_a = Dir.glob("/Users/makun/Desktop/freemarket_sample_59-e/app/assets/images/image/*")
# 100.times do |i|
#   image = Image.new(
#     image: File.open(image_a.sample),
#     item_id: i+10,
#     )
#   image.save!

# end

# image_a = Dir.glob("/Users/ryotaaoyagi/freemarket_sample_59期チームe/app/assets/images/image/*")
# 100.times do |i|
#   image = Image.new(
#     image: File.open(image_a.sample),
#     item_id: i + 2,
#     )
#   image.save!
# end



require "csv"

# CSV.foreach('db/sizetypes.csv', headers: true) do |row|
#     Sizetype.create(
#     sizetype: row['sizetype'],
#     created_at: row['created_at'],
#     updated_at: row['updated_at'],
#     ancestry: row['ancestry']
#   )
#   end

# # CSV.foreach('db/brands.csv', headers: true) do |row|
# #     Brand.create(
# #     name: row['name'],
# #     created_at: row['created_at'],
# #     updated_at: row['updated_at'],
# #     )
# # end

# CSV.foreach('db/categories.csv', headers: true) do |row|
#     Category.create(
#     name: row['name'],
#     created_at: row['created_at'],
#     updated_at: row['updated_at'],
#     ancestry: row['ancestry'],
#     sizetype_id: row['sizetype_id'],
#     title: row['title'],
#     text: row['text']

#     )
# end




require "csv"

# CSV.foreach('db/sizetypes.csv', headers: true) do |row|
#     Sizetype.create(
#     # id: row['id'],
#     sizetype: row['sizetype'],
#     created_at: row['created_at'],
#     updated_at: row['updated_at'],
#     ancestry: row['ancestry']
#   )
#   end

# CSV.foreach('db/brands.csv', headers: true) do |row|
#     Brand.create(
#     # id: row['id'],
#     name: row['name'],
#     created_at: row['created_at'],
#     updated_at: row['updated_at'],
#     )
# end

# CSV.foreach('db/categories.csv', headers: true) do |row|
#     Category.create(
#     # id: row['id'],
#     name: row['name'],
#     created_at: row['created_at'],
#     updated_at: row['updated_at'],
#     ancestry: row['ancestry'],
#     sizetype_id: row['sizetype_id'],
#     title: row['title'],
#     text: row['text']
#     )
# end




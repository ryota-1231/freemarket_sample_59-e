<<<<<<< Updated upstream
require 'mechanize'

  agent = Mechanize.new
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



  
    current_page = agent.get("https://www.mercari.com/jp/brand/?brand_group_id=#{1}")
    brands = current_page.search('.brand-list-box')
    
    brand_title = brands.at('h3').inner_text
    brand_groups = brands.search('p')

    # parent = Brand.create(name: brand_title) 
    brand_groups.each do |brand_name|
      puts parent
      # child = parent.children.create(name: brand_name)
    end


  
=======
# require 'mechanize'

#   agent = Mechanize.new
#   # current_page = agent.get("https://www.mercari.com/jp/category/")
#   # parents = current_page.search('.category-list-individual-box')
#   # categories = {}

#   # parents.each do |parent|
#   #   parent_name = parent.at('h3').inner_text
#   #   categories[parent_name] = {}
#   #   children = parent.search('.category-list-individual-box-sub-category-name')
#   #   grandchildren = parent.search('.category-list-individual-box-sub-sub-category-box')
#   #   container = children.zip(grandchildren)

#   #   container.each do |content|
#   #     child_name = content[0].at('h4').inner_text
#   #     next if child_name=="すべて"
#   #     categories[parent_name][child_name] = []

#   #     content[1].search('.category-list-individual-box-sub-sub-category-name').each do |grandchild|
#   #       grandchild_name = grandchild.at('p a').inner_text.strip
#   #       next if grandchild_name=="すべて"
#   #       categories[parent_name][child_name] << grandchild_name
#   #     end
#   #   end
#   # end

#   # categories.keys.each do |parent_name|
#   #   parent = Category.create(name: parent_name) 
#   #   categories[parent_name].keys.each do |children_name|
#   #     child = parent.children.create(name: children_name)
#   #     categories[parent_name][children_name].each do |grandchild_name|
#   #       child.children.create(name: grandchild_name)  
#   #     end
#   #   end
#   # end



#   for i in 1..17 do
#     if i==9 
#       next
#     else
#       current_page = agent.get("https://www.mercari.com/jp/brand/?brand_group_id=#{i}")
#       brands = current_page.search('.brand-list-box')
      
#       brand_title = brands.at('h3').inner_text.strip
#       brand_groups = brands.search('p')

     

#       parent = Brand.create(name: brand_title) 
#       brand_groups.each do |brand_name|
#         posts= brand_name.inner_text.strip
#         child = parent.children.create(name: posts)
#       end

      
      
#     end
#   end


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
>>>>>>> Stashed changes

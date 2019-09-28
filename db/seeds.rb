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



  
    # current_page = agent.get("https://www.mercari.com/jp/brand/?brand_group_id=#{1}")
    # brands = current_page.search('.brand-list-box')
    
    # brand_title = brands.at('h3').inner_text
    # brand_groups = brands.search('p')

    # # parent = Brand.create(name: brand_title) 
    # brand_groups.each do |brand_name|
    #   puts parent
    #   # child = parent.children.create(name: brand_name)
    # end


  


  size_group = {}
  current_page = agent.get("http://localhost:3000/users/test")
  groups = current_page.search('.group')
  
  groups.each do |group|
    size_category = group.at('h3').inner_text
    size_group[size_category] = []
    group.search('p').each do |child|
      size_child = child.inner_text
      size_group[size_category] << size_child
    end
  end
  
  size_group.keys.each do |size_category|
    parent = Sizetype.create(sizetype: size_category) 
    size_group[size_category].each do |children_name|
      parent.children.create(sizetype: children_name)
    end
  end
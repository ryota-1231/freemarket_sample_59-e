require 'mechanize'

  agent = Mechanize.new
  current_page = agent.get("https://www.mercari.com/jp/category/")
  parents = current_page.search('.category-list-individual-box')
  categories = {}

  parents.each do |parent|
    parent_name = parent.at('h3').inner_text
    categories[parent_name] = {}
    children = parent.search('.category-list-individual-box-sub-category-name')
    grandchildren = parent.search('.category-list-individual-box-sub-sub-category-box')
    container = children.zip(grandchildren)

    container.each do |content|
      child_name = content[0].at('h4').inner_text
      next if child_name=="すべて"
      categories[parent_name][child_name] = []

      content[1].search('.category-list-individual-box-sub-sub-category-name').each do |grandchild|
        grandchild_name = grandchild.at('p a').inner_text.strip
        next if grandchild_name=="すべて"
        categories[parent_name][child_name] << grandchild_name
      end
    end
  end

 

  categories.keys.each do |parent_name|
    parent = Category.create(name: parent_name) 
    categories[parent_name].keys.each do |children_name|
      child = parent.children.create(name: children_name)
      categories[parent_name][children_name].each do |grandchild_name|
        child.children.create(name: grandchild_name)  
      end
    end
  end
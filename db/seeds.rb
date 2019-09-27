require 'mechanize'


  links = [] # 個別ページのリンクを保存する配列

  agent = Mechanize.new
  current_page = agent.get("https://www.mercari.com/jp/category/")
  parents_name = current_page.search('.category-list-box h3')
  children_name = current_page.search('.category-list-individual-box-inner-box h4')
  grandchild_name = current_page.search('.category-list-individual-box-sub-sub-category-box a')

parents = {}
children = {} 
grandchild= {}

  parents_name.each do |parent|
    parents[:name]=parent.inner_text
    category = Category.create(parents[:name])
    children_name.each do |child|
      
      children[:name]=child.inner_text
      category_child = category.children.create(children[:name])
      grandchild_name.each do |grandchild|
       
        grandchild[:name]=grandchild.inner_text unless grandchild.inner_text=='すべて'
        category_child.children.create(grandchild[:name])
      end
    end
  end
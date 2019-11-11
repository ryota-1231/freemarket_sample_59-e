crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", "/users/:id" 
end

crumb :card do
  link "支払い方法", "/users/register"
  parent :mypage
end

crumb :profile do
  link "プロフィール", "/users/:id/edit"
  parent :mypage
end

crumb :user_registe do
  link "本人情報の登録", "/items/:id"
  parent :mypage
end

crumb :log_out do
  link "ログアウト", "/users/log_out"
  parent :mypage
end  

crumb :address_alter do
  link "発送元・お届け先住所変更", "/users/:user_id/signup/:id/edit"
  parent :mypage
end  

crumb :sms_confirmation do
  link "電話番号の確認", "/users/sms_confirmation"
  parent :mypage
end 

crumb :item_exhibit do
  link "出品した商品-出品中", "/users/exhibit"
  parent :mypage
end 

crumb :item_trading do
  link "出品した商品-取引中", "/users/trading"
  parent :mypage
end 

crumb :item_soldout do
  link "出品した商品-売却済", "/users/soldout"
  parent :mypage
end 



# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
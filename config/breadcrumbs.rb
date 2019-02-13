crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", users_path
  parent :root
end

crumb :card do
  link "支払い方法", card_users_path
  parent :mypage
end

crumb :profile do
  link "プロフィール", profile_users_path
  parent :mypage
end

crumb :identification do
  link "本人情報の登録", identification_users_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_users_path
  parent :mypage
end

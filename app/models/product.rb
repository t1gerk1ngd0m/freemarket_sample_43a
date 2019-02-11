class Product < ApplicationRecord
  has_many :item_images, :dependent => :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  with_options presence: true do
    validates :name
    validates :description
    validates :category_large
    validates :category_middle
    validates :category_small
    validates :size
    validates :shipping_charges_burden
    validates :dispatch_area
    validates :shipping_method
    validates :number_of_the_days_to_ship
    validates :price
    validates :condition
  end

  enum dispatch_area: {
   "---": 0, 北海道: 1,青森県: 2,岩手県: 3,宮城県: 4,秋田県: 5,山形県: 6,福島県: 7,
   茨城県: 8, 栃木県: 9, 群馬県: 10, 埼玉県: 11, 千葉県: 12, 東京都: 13, 神奈川県: 14,
   新潟県: 15, 富山県: 16, 石川県: 17, 福井県: 18, 山梨県: 19, 長野県: 20,
   岐阜県: 21, 静岡県: 22, 愛知県: 23, 三重県: 24,
   滋賀県: 25, 京都府: 26, 大阪府: 27, 兵庫県: 28, 奈良県: 29, 和歌山県: 30,
   鳥取県: 31, 島根県: 32, 岡山県: 33, 広島県: 34, 山口県: 35,
   徳島県: 36, 香川県: 37, 愛媛県: 38, 高知県: 39,
   福岡県: 40, 佐賀県: 41, 長崎県: 42, 熊本県: 43, 大分県: 44, 宮崎県: 45, 鹿児島県: 46, 沖縄県: 47, 未定: 99
  }, _suffix: true

  enum condition: {
   "---": 0, "新品、未使用": 1, "未使用に近い": 2, "目立った傷や汚れなし": 3, "やや傷や汚れあり": 4, "傷や汚れあり": 5, "全体的に状態が悪い": 6
  }, _suffix: true

  enum shipping_charges_burden: {
   "---": 0, "送料込み(出品者負担)": 1, "着払い(購入者負担)": 2
  }, _suffix: true

  enum shipping_method: {
   "---": 0, "未定": 1, "らくらくメルカリ便": 2, "ゆうメール": 3, "レターパック": 4, "普通郵便(定形、定形外)": 5, "普通郵便(定形、定形外)": 6, "クロネコヤマト": 7, "ゆうパック": 8, "クリックポスト": 9, "ゆうパケット": 10
  }, _suffix: true

  enum number_of_the_days_to_ship: {
   "---": 0, "1~2日で発送": 1, "2~3日で発送": 2, "4~7日で発送": 3
  }, _suffix: true

  enum size: {
   "---": 0, "XXS以下": 1, "XS(SS)": 2, "S": 3, "M": 4, "L": 5, "XL(LL)": 6, "2XL(3L)": 7,
   "3XL(4L)": 8, "4XL(5L)以上": 9, "FREE SIZE": 10, "20cm以下": 11, "20.5cm": 12, "21cm": 13,
   "21.5cm": 14, "22cm": 15, "22.5cm": 16, "23cm": 17, "23.5cm": 18, "24cm": 29,
   "24.5cm": 20, "25cm": 21, "25.5cm": 22, "26cm": 23,
   "26.5cm": 24, "27cm": 25, "27.5cm以上": 26
  }, _suffix: true

  enum category_large: {
   "---": 0, "レディース": 1, "メンズ": 2, "ベビー・キッズ": 3
  }, _suffix: true

  enum category_middle: {
   "---": 0, "ジャケット/アウター": 1, "スカート": 2, "靴": 3, "ジャケット/アウター": 4, "パンツ": 5,
   "靴": 6, "ベビー服(男女兼用)  ~95cm": 7, "キッズ服(男女兼用) 100cm~": 8, "キッズ靴": 9
  }, _suffix: true

  enum category_small: {
   "---": 0, "テーラードジャケット": 1, "ノーカラージャケット": 2, "Gジャン/デニムジャケット": 3, "レザージャケット": 4, "ダウンジャケット": 5, "ライダースジャケット": 6, "ミリタリージャケット": 7,
   "ダウンベスト": 8, "ジャンパー/ブルゾン": 9, "ポンチョ": 10, "ロングコート": 11, "トレンチコート": 12, "ダッフルコート": 13,
   "ピーコート": 14, "チェスターコート": 15, "モッズコート": 16, "スタジャン": 17, "毛皮/ファーコート": 18, "スプリングコート": 29,
   "スカジャン": 20, "その他": 21
  }, _suffix: true

end

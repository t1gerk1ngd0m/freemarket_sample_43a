## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|profile|string|null: false|
|address|string|null: false|
|payment_method|string|null: false|
|birthday|date|null: false|
|tell|string|null: false|

### Association
- has_many :products
- has_many :likes
- has_many :purchases
- belongs_to :image

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|description|string|null: false|
|category_large_id|string|null: false, foreign_key: true|
|category_middle_id|string|null: false, foreign_key: true|
|category_small_id|string|null: false, foreign_key: true|
|brand_id|string|null: false, foreign_key: true|
|size|string|null: false|
|status|string|null: false|
|shipping_charges_burden|string|null: false|
|dispatch_area|string|null: false|
|shipping_method|string|null: false|
|number_of_the_days_to_ship|string|null: false|
|price|integer|null: false|
|body|string|null: false|
|condition|string|null: false|

### Association
- has_many :images
- has_many :likes
- belongs_to :user
- belongs_to :brand
- belongs_to :purchase
- belongs_to :category_large
- belongs_to :category_middle
- belongs_to :category_small

## category_largeテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :category_large_middles
- belongs_to :product

## category_middleテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :category_large_middles
- has_many :category_middle_smalls
- belongs_to :product

## category_smallテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :category_middle_smalls
- belongs_to :product

## category_large_middleテーブル

|Column|Type|Options|
|------|----|-------|
|category_large_id|integer|null: false, foreign_key: true|
|category_middle_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :category_large
- belongs_to :category_middle

## category_middle_smallテーブル

|Column|Type|Options|
|------|----|-------|
|category_middle_id|integer|null: false, foreign_key: true|
|category_small_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :category_middle
- belongs_to :category_small

## brandテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- belongs_to :product

## imageテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|integer|foreign_key: true|
|product_id|integer|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## likeテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## feedbackテーブル

|Column|Type|Options|
|------|----|-------|
|purchase_id|integer|null: false, foreign_key: true|
|lank|string|null: false|

### Association
- belongs_to :purchase

## purchaseテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
|price_pay|integer|null: false|
|shipping_address|string|null: false|
|payment_method|string|null: false|

### Association
- belongs_to :user
- belongs_to :product
- belongs_to :feedback

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
|category1_id|string|null: false, foreign_key: true|
|category2_id|string|null: false, foreign_key: true|
|category3_id|string|null: false, foreign_key: true|
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
- belongs_to :category1
- belongs_to :category2
- belongs_to :category3

## category1テーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :category1-2s
- belongs_to :product

## category2テーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :category1-2s
- has_many :category2-3s
- belongs_to :product

## category3テーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :category2-3s
- belongs_to :product

## category1-2テーブル

|Column|Type|Options|
|------|----|-------|
|category1_id|integer|null: false, foreign_key: true|
|category2_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :category1
- belongs_to :category2

## category2-3テーブル

|Column|Type|Options|
|------|----|-------|
|category2_id|integer|null: false, foreign_key: true|
|category3_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :category2
- belongs_to :category3

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

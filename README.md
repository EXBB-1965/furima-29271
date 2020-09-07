# テーブル設計

## users テーブル

| Column                | Type   | Options                   |
| :-------------------: | :----: | :-----------------------: |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| password              | string | null: false, unique: true |
| password confirmation | string | null: false, unique: true |
| family_name           | string | null: false               |
| first_name            | string | null: false               |
| family_name_kana      | string | null: false               |
| first_name_kana       | string | null: false               |
| birth_day             | date   | null: false               |

### Association

- has_many :products
- has_many :orders

## products テーブル

| Column           | Type       | Options               |
| :--------------: | :--------: | :-------------------: |
| user             | references | null: false, FK: true |
| name             | string     | null: false           |
| discription      | text       | null: false           |
| category_id      | integer    | null: false           |
| status_id        | integer    | null: false           |
| payer_id         | integer    | null: false           |
| prefecture_id    | integer    | null: false           |
| shipping_day_id  | integer    | null: false           |
| price            | integer    | null: false           |

### Association

- belongs_to :user
- has_one :order
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :payer
- belongs_to_active_hash :shipping_day
- belongs_to_active_hash :prefecture

## purchasers テーブル

| Column        | Type       | Options                   |
| :-----------: | :--------: | :-----------------------: |
| order         | references | null: false, FK: true     |
| post_code     | string     | null: false               |
| prefecture_id | integer    | null: false               |
| city          | string     | null: false               |
| address       | string     | null: false               |
| building_name | string     |                           |
| phone_number  | string     | null: false, unique: true |

### Association

- belongs_to_active_hash :prefecture
- belongs_to :order


## ordersテーブル

| Column    | Type       | Options               |
| :-------: | :--------: | :-------------------: |
| user      | references | null: false, FK: true |
| product   | references | null: false, FK: true |


### Association

- belongs_to :user
- belongs_to :product
- has_one :purchaser
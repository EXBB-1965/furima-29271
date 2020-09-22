# テーブル設計

## users テーブル

| Column                | Type   | Options                   |
| :-------------------: | :----: | :-----------------------: |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false,              |
| last_name             | string | null: false               |
| first_name            | string | null: false               |
| last_name_kana        | string | null: false               |
| first_name_kana       | string | null: false               |
| birth_date            | date   | null: false               |

### Association

- has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item", dependent: :destroy
- has_many :saling_items, -> {where("buyer_id is NULL")}, foreign_key: "saler_id", class_name: "Item"
- has_many :sold_items, -> {where("buyer_id is not NULL")}, foreign_key: "saler_id", class_name: "Item"
- has_many :orders

## items テーブル

| Column           | Type       | Options               |
| :--------------: | :--------: | :-------------------: |
| saler-id         | references | null: false, FK: true |
| name             | string     | null: false           |
| discription      | text       | null: false           |
| category_id      | integer    | null: false           |
| status_id        | integer    | null: false           |
| payer_id         | integer    | null: false           |
| prefecture_id    | integer    | null: false           |
| shipping_day_id  | integer    | null: false           |
| price            | integer    | null: false           |
| buyer-id         | integer    |                       |

### Association

- belongs_to :saler, class_name: "User", optional: true
- belongs_to :buyer, class_name: "User", optional: true
- has_one :order
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :payer
- belongs_to_active_hash :shipping_day
- belongs_to_active_hash :prefecture

## addresses テーブル

| Column        | Type       | Options                   |
| :-----------: | :--------: | :-----------------------: |
| order         | references | null: false, FK: true     |
| postal_code   | string     | null: false               |
| prefecture_id | integer    | null: false               |
| city          | string     | null: false               |
| address       | string     | null: false               |
| building      | string     |                           |
| phone_number  | string     | null: false, unique: true |

### Association

- belongs_to_active_hash :prefecture
- belongs_to :order, optional: true


## ordersテーブル

| Column    | Type       | Options               |
| :-------: | :--------: | :-------------------: |
| user      | references | null: false, FK: true |
| item      | references | null: false, FK: true |


### Association

- belongs_to :user, optional: true
- belongs_to :item, optional: true
- has_one :address
# テーブル設計

## users テーブル

| Column                | Type   | Options                   |
| :-------------------: | :----: | :-----------------------: |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| password              | string | null: false, unique: true |
| password_confirmation | string | null: false, unique: true |
| family_name           | string | null: false               |
| first_name            | string | null: false               |
| family_name_kana      | string | null: false               |
| first_name_kana       | string | null: false               |
| birth_day             | date   | null: false               |

### Association

- has_many :products
- has_many :purchasers

## products テーブル

| Column           | Type       | Options                       |
| :--------------: | :--------: | :---------------------------: |
| user             | references | null: false, foreign_key: true|
| images_id        | integer    | null: false                   |
| name             | string     | null: false                   |
| discription      | text       | null: false                   |
| category_id      | integer    | null: false                   |
| status_id        | integer    | null: false                   |
| payer_id         | integer    | null: false                   |
| prefecture_id    | integer    | null: false                   |
| shipping_day_id  | integer    | null: false                   |
| price            | integer    | null: false                   |

### Association

- belongs_to :user
- has_one : purchasers
- has_many : images
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :payer
- belongs_to_active_hash :shipping_day
- belongs_to_active_hash :prefecture

## purchasers テーブル

| Column        | Type       | Options                        |
| :-----------: | :--------: | :----------------------------: |
| product       | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false, unique: true      |

### Association

- belongs_to :user
- belongs_to :product
- belongs_to_active_hash :prefecture

## images テーブル
| Column  | Type       | Options                        |
| :-----: | :--------: | :----------------------------: |
| product | references | null: false, foreign_key: true |
| image   | string     | null: false                    |

### Association

-belongs_to :product
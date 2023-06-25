## usersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| nickname            | string     | null: false,      |
| email               | string     | null: false, unique: true      |
| encrypted_password  | string     | null: false,      |
| lastname1           | string     | null: false, 全角      |
| firstname1          | string     | null: false, 全角、        |
| lastname1           | string     | null: false, 全角、カタカナ |
| firstname1          | string     | null: false, 全角、カタカナ |
| birth               | date       | null: false, |


### Association
- has_many :items
- has_many :orders
- 



## itemsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name                | string     | null: false,  |
| content             | text       | null: false   |
| price               | integer    | null: false,  |
| genre_id            | integer    | null: false, |
| states_id           | integer    | null: false, |
| deriver_cost_id    | integer    | null: false, |
| prefecture_id      | integer    | null: false, |
| deriver_day_id     | integer    | null: false, |

| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order
- belongs_to :genre

## ordersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |

| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |


### Association
- belongs_to :item
- belongs_to :user
- has_one :address

## addressesテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| post_code  | string       | null: false,              |
| prefecture_id | string       | null: false,              |
| city       | string       | null: false,              |
| s_num      | string       | null: false,              |
| build_name | string       | null: false,              |
| tel        | string       | null: false,  11桁必須     |

| order                | references | null: false, foreign_key: true |


### Association
- belongs_to :order

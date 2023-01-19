Welcome to the Bad Egg Training Team website!


This is a fitness website, which introduces the new and upcoming fitness team known as the Bad Egg Training Team.
On this website, users can view the specifics of what the team is about, such as training methods, fitness trainers, the overall feel of the team, and merchandise. 
By viewing this website, users searching for a new fitness community to take part in can determine if this team is best for them.
The website also serves as an online store, where users can purchase t shirts. 

All logos and t shirt designs are designed by myself, and do not conflict with copyrights.  


## users table

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders




## items table

| Column          | Type   | Options                           |
| ----------------| ------ | ------------                |
| name            | string | null: false                          |
| size_id         | integer   | null: false                      |  
| shipping_cost_id| integer| null: false                  |
| prefecture_id   | integer| null: false                     |
| shipping_date_id| integer| null: false                 |
| price           | integer| null: false                           |
| user            | references| null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order



## orders table

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
  has_one :destination



## destinations table


| Column          | Type      | Options     |
| ----------------| --------- | ----------- |
| postal_code     | string    | null: false |
| prefecture_id   | integer   | null: false |
| city            | string    | null: false |
| block           | string    | null: false |
| building        | string    |             |
| phone_number    | string    | null: false |
| order           |references | null: false, foreign_key: true |

### Association

- belongs_to : order

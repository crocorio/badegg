Welcome to the Bad Egg Training Team website!


This is a fitness website, which introduces the new and upcoming fitness team known as the Bad Egg Training Team.
On this website, users can view the specifics of what the team is about, such as training methods, fitness trainers, the overall feel of the team, and merchandise. 
By viewing this website, users searching for a new fitness community to take part in can determine if this team is best for them.
The website also serves as an online store, where users can purchase t shirts. 



All logos and t shirt designs are designed by myself, and do not conflict with copyrights.  

This app/website is currently in the process of being created, and several functions are planned to be implemented. These consist of:

A function that allows the admin user full control of the website (mainly for managing merchandise)
A function that allows multiple images to be uploaded (so that front and back images of the merchandise can be promoted)

Because I would like the foundation of the website to be created first, these functions are not prioritized at the moment.  



## users table

For the users table, the 2 items required are an email, and a password.
The reason for this is due to the website being managed by the fitness team, and no one else. 
Unless staff members increase, and a scenario where several staff accounts should be created is presented, I believe it is better for the website to be managed by one account. 

However, a function where the admin user has control of all functions is currently in the process of being implemented as a superior solution. 


| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |


### Association

- has_many :items
- has_many :orders




## items table

The items table includes information required for the customer to determine if they would like to make a purchase. These include the image of the product, the description, and how long it would take to ship. The size of the product can be chosen upon checking out. 

Merchandise can be uploaded to the website only if the user is logged in. The users in this case are staff members, and customers are not required to login in order to purchase merchandise.
As was stated above, an additional function for the admin user to have full control of the website, primarily for merchandise sales, is currently in the process of being implemented.  



| Column          | Type   | Options                           |
| ----------------| ------ | ----------------------------------|
| name            | string | null: false                       |
| shipping_cost_id| integer| null: false                       |
| shipping_date_id| integer| null: false                       |
| price           | integer| null: false                       |
| user            | references| null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order



## orders table

The orders table requires the item.id. This is because products can be purchased without a customer logging in. The reason for this is because the main purpose of the website is to promote the fitness team, and products being sold are treated as an additional function. 
Also, in our daily life there are many occasions where you would come across a product that you are interested in, yet choose not to purchase it when asked to sign up an account. 


| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
  has_one :destination



## destinations table

The destination table has all the items required for the customer to have the product shipped to them. Because the customer does not need to login to purchase an item, there are columns for the customer to input their name and email, so that a confirmation can be sent to them. 



| Column          | Type      | Options                         |
| ----------------| --------- | --------------------------------|
| postal_code     | string    | null: false                     |
| prefecture_id   | integer   | null: false                     |
| size_id         | integer   | null: false                     |
| city            | string    | null: false                     |
| block           | string    | null: false                     |
| building        | string    |                                 |
| phone_number    | string    | null: false                     |
| email           | string    | null: false                     |
| order           |references | null: false, foreign_key: true  |

### Association

- belongs_to : order

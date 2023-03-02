Welcome to the Bad Egg Training Team website!


This is a fitness website, which introduces the new and upcoming fitness team known as the Bad Egg Training Team.
On this website, users can view the specifics of what the team is about, such as training methods, fitness trainers, the overall feel of the team, and merchandise. 
By viewing this website, users searching for a new fitness community to take part in can determine if this team is best for them.
The website also serves as an online store, where users can purchase t shirts. 



All logos and t shirt designs are designed by myself, and do not conflict with copyrights.  

This app/website is currently in the process of being created, and several functions are planned to be implemented. These consist of:

1. A function that allows the admin user full control of the website (mainly for managing merchandise).
2. A function that allows multiple images to be uploaded (so that front and back images of the merchandise can be promoted).



Because I would like the foundation of the website to be created first, these functions are not prioritized at the moment.  

This website is created in English, because I wish to utilize my English skills in the field. (Working in an English environment, abroad, etc.)


## Admin ID and password
ID: admin
password: 2222



JP: 
Bad Egg Training Teamへようこそ！

このウェブサイトは Bad Egg Training Teamと呼ばれるフィットネスクラブの紹介サイトでございます。
こちらのサイトを観覧することで、クラブチームの雰囲気をはじめ、トレーニングメソッドやトレーナーの紹介を拝見することができます。また、スタッフログイン中のユーザーは商品を出品することができ、サイトを拝見する方はそれら商品を購入することができます。
自分一人でトレーニングに励むことに抵抗のある方、何かのコミュニティの一員になりたい方はこのサイトを拝見して頂けたらと思います。

サイトに投稿されているロゴ、シャツのデザインは全て自作であり、著作権に引っかかることはございません。

このサイトは只今制作中でございます。今後、以下の実装を行う予定でございます。
1. 管理者のみへウェブサイトの権限を与える実装（出品商品を安全に管理するため）
2. 複数の画像を投稿できる実装（出品商品の前、後ろ、着用イメージを投稿するため） 


ウェブサイトの土台を先に完成させるため、以上の実装は優先していません。

このウェブサイトは英語で制作されております。自分の英語力を現場で活かしたいと思うためです（英語環境で働く、海外で働くなど）  


## Admin IDとパスワード
ID: admin
password: 2222


## users table

For the users table, the 2 items required are an email, and a password.
The reason for this is due to the website being managed by the fitness team, and no one else. 
Unless staff members increase, and a scenario where several staff accounts should be created is presented, I believe it is better for the website to be managed by one account. 

However, a function where the admin user has control over all functions is currently in the process of being implemented as a superior solution. 

The current user account to create merchandise is 
email: rio@gmail.com
password: hakoniwa


JP:
usersテーブルにはemailとpasswordが求められます。
ログインするのはサイト管理者であり、他の方がログインしないためです。
スタッフの数が増え、複数のスタッフアカウントが必要となる状況とならない限りは、一つのアカウントで管理した方が良いと思ったためです。

ただし、より良い解決策として管理者のみがログイン、新規登録できる仕様を実装中でございます。

商品出品用のアカウントは以下となります。
メールアドレス：rio@gmail.com
パスワード：hakoniwa




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


JP:

itemsテーブルには、ゲストが商品を購入するか判断するための情報が含まれております。
商品の画像、説明欄、発送までの日数が含まれております。サイズに関しましては購入の際に選択する仕様でございます。

商品出品はスタッフユーザーログイン中のみ行うことができます。ゲストは商品購入にログインする必要はございません。
上記でも記載した通り、管理者のみがログイン、新規登録できる仕様を実装中でございます。




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

Products can be purchased with a credit card. The dummy credit card is;
credit card number: 4242424242424242
exp date: any date in the future 
card cvc: 123 


JP:

ordersテーブルにはitem.idが必要となります。ゲストが商品を購入する際にログインする必要はないためです。ウェブサイトの主な役割はクラブの紹介のためであり、商品を出品する理由はゲストとチームの間に一体感を作るためであるからです。また、日常の中でもウェブ上で購入したい商品を発見した際に、購入手続きに新規登録が求められるケースが多く、そのため購入を断念することが多いと考えたからです。

商品はクレジットカードで購入できる仕様です。ダミーカード情報は以下となります：
カード番号：4242424242424242　
有効期限：未来の日付
カードcvc：123




| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
  has_one :destination



## destinations table

The destination table has all the items required for the customer to have the product shipped to them. Because the customer does not need to login to purchase an item, there are columns for the customer to input their name and email, so that a confirmation can be sent to them. 


JP:

destinationテーブルには商品をゲストへお届けするための項目が全て含まれております。
商品を購入するためにログインは不要であるため、送り先のお名前と商品購入確認のメールをお送りするためにお名前とメールを求めております。




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




## About us page 

The about us page serves as the staff introduction page. On this page, guests can view the various trainers the team has, and what their attributes are. This helps guests who are searching for a fitness community to determine if the team provides what they are looking for.
A large part of training in a community depends on whom you train with. If one, or some of the trainers can provide what the guests need, this can help them achieve their goals. 



JP:
About usページでは、スタッフの紹介を見ることができます。
スタッフそれぞれのバックグランドを紹介するためのページです。
どのようなトレーナーがいて、ゲストが求めているものを提供できるかを判断することができます。
コミュニティの一員としてトレーニングするにおいては、誰とトレーニングを共にするかが 大きな要素となります。ゲストの要望に応えられるトレーナーが一人、または二人存在する場合は、ゲストのゴール達成へ大きく貢献できます。


## Workouts page 

The workouts page has listed some unique exercises the team provides, along with descriptions on why the exercise is important, and how to perform them. 
This helps the guests determine if the team provides the type of training which helps their needs.
The page introduces exercises that the team excels at. By viewing them, guests can form an idea of what they want to achieve. The content of the workouts are written comedically, so that the guests are not intimidated, and get a feel of the vibe our team offers.  

JP:
Workoutsページでは、チームが教えるトレーニングを紹介しております。
このページを見ることによって、ゲストは自分の求めているトレーニングや結果を提供して頂けるかを判断することができます。
このページではチームが得意としている運動を紹介します。これらを拝見することによって、ゲスト自身のフィットネスゴールを抱きやすくなっております。運動内容はユーモアを含んだ記載となっており、チーム全体の雰囲気をゲストへ伝えております。


## Nutrition page


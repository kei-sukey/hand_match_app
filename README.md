# アプリケーション名
## HandMatch </br>

# アプリケーション概要
ハンドメイド作品（アクセサリーに特化）の投稿サイト。 </br>
自分の投稿した作品が、日の目を浴びず埋もれてしまうという </br>
悩みを持つクリエイターと、多様な作品との出会いを求める </br>
ユーザーを結びつけるために実装しました。 </br>

# URL
### https://hand-match-app.herokuapp.com/
</br>

# テスト用アカウント
アカウントニックネーム: テストアカウント </br>
email: abc@sample.com </br>
pass: abc123 </br>

# 利用方法
ユーザー登録しログインすることで作品を出品することが出来ます。 </br>
自身が投稿した作品は、編集、削除することも可能です。 </br>
出品された商品は閲覧、コメントが可能で、カテゴリを選んで作品を探すことも可能です。 </br>
作品をランダムで表示する仕様で、作品とユーザーの偶然のマッチング機会を提供します。 </br>

# 目指した課題解決
ハンドメイド作品の出品、販売を副業で始めようとした時、大手マーケットサイトでは既に他者の出品数が多く競争が激しく、始めたばかりのクリエイターの作品は、買い手に見つけてすらもらえないという課題があります。</br>
マッチングアプリのように、出品作品一つ一つをランダムで表示させるようにして、作品とユーザーを結びつけることで、埋もれていた作品に光をあてたいと考えました。ランダム性から、ユーザー側の好奇心も、一層高まると考えます。</br>
</br>

# 洗い出した要件
| 優先順位<br>（高：3、中：2、低：1） | 機能                 | 目的                                                   | 詳細                                                                         | ストーリー(ユースケース)                                                                                                                                                                                                                                       | 見積もり（所要時間） | 
| ----------------------------------- | -------------------- | ------------------------------------------------------ | ---------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------- | 
| 3                                   | ユーザー管理機能     | 登録したユーザーのみ作品投稿や購入が出来るようにする。 | 出品者、購入者はログインをすることで出品購入することができる。               | ・新規登録ページを設け、ユーザー登録をさせる。<br>・トップページはログインページか新規登録ページへのリンクのみ表示。<br>・ニックネーム、性別、年齢、メールアドレス、電話番号を登録する。<br>・マイページに登録した情報や、出品した作品などの情報を掲載できる。 | 5                    | 
| 3                                   | 商品出品機能         | 作品を出品登録することができる。                       | 名前、種類、価格などの条件を登録し、作品を出品することができる。             | ・ログインしたユーザーは作品を出品することができる。<br>・作品名、カテゴリ、価格、送料、などの条件を登録する。<br>・作品の写真も登録する必要がある。                                                                                                           | 5                    | 
| 2                                   | 出品作品編集削除機能 | 自身が出品した作品を編集、削除することができる。       | 投稿者が出品した作品の内容を編集、または削除することができる。               | ・出品した作品に変更が生じた時、また出品を取り消したい時に編集、削除ができる。                                                                                                                                                                                 | 3                    | 
| 2                                   | カテゴリ選択表示機能 | 出品された作品をカテゴリで絞り込むことができる。       | カテゴリを指定し、出品された作品を絞り込み表示させる。                       | ・カテゴリを選択すると、選択したカテゴリにマッチした作品が表示される。                                                                                                                                                                                         | 10                   | 
| 3                                   | ランダム表示機能     | 出品作品をランダムで取得できる。                       | 出品された作品をランダムで表示させる。                                       | ・条件に該当する作品を1ページに一つずつ繰り返し表示させ、2択で、お気に入り/違う、を選択させる。                                                                                                                                                                | 10                   | 
| 2                                   | 作品コメント機能     | 購入した作品の出品者にコメントすることができる。       | 購入した作品や、対応についてのコメントを残すことができる。                   | ・購入した作品の出品者に対して、購入者のみコメント出来、出品者は返信できる。                                                                                                                                                                                   | 5                    | 
| 1                                   | お気に入り登録機能   | ユーザーをお気に入り登録し、フォローできる。           | 出品者をお気に入り登録することで、その出品者の作品を追いかけることができる。 | ・作品の出品者をお気に入り登録することができる。                                                                                                                                                                                                               | 10                   | 
| 2                                   | 作品購入機能         | 出品された作品を購入することができる。                 | 購入したい作品を選び、購入を完了させる。<br>Pay.jpを使用する。               | ・「作品購入ボタン」をクリックしたら、DB及びPAY.JPサイトに購入した作品情報が更新される。<br><br>・購入済みの作品は、「購入ボタン」を押せないようにする。                                                                                                       | 10                   | 
</br>

# 実装した機能についてのGIFと説明
- トップページから新規登録画面、ログイン画面への遷移</br>
[![Image from Gyazo](https://i.gyazo.com/7876c98bafc039b29a59c5f47011f04b.gif)](https://gyazo.com/7876c98bafc039b29a59c5f47011f04b)

- 新規ユーザー登録の挙動</br>
[![Image from Gyazo](https://i.gyazo.com/92402a9e9f0dcced6f5e408897a5dc50.gif)](https://gyazo.com/92402a9e9f0dcced6f5e408897a5dc50)

- ログイン済トップページから新規作品投稿画面への遷移</br>
[![Image from Gyazo](https://i.gyazo.com/4c85eefdaf26bd7552e111ec641ccc6e.gif)](https://gyazo.com/4c85eefdaf26bd7552e111ec641ccc6e)

- 新規作品投稿の挙動</br>
[![Image from Gyazo](https://i.gyazo.com/126e7f7040483eb80d1c1b03d443b71e.gif)](https://gyazo.com/126e7f7040483eb80d1c1b03d443b71e)

- 作品が投稿されたトップページの表示</br>
[![Image from Gyazo](https://i.gyazo.com/ded85fe0d0bd3a6f16d1fc2e8d88447a.gif)](https://gyazo.com/ded85fe0d0bd3a6f16d1fc2e8d88447a)

- 作品詳細ページ</br>
[![Image from Gyazo](https://i.gyazo.com/87e4ef34cc2e5dd47ea7e5d1f4d0c13a.gif)](https://gyazo.com/87e4ef34cc2e5dd47ea7e5d1f4d0c13a)

- 作品向けコメント投稿機能</br>
[![Image from Gyazo](https://i.gyazo.com/37eec95db2794870412116b0c6812543.gif)](https://gyazo.com/37eec95db2794870412116b0c6812543)

- トップページの作品ランダム3品表示</br>
[![Image from Gyazo](https://i.gyazo.com/dd0c26944e56ea71a719ade90c890014.gif)](https://gyazo.com/dd0c26944e56ea71a719ade90c890014)

- ユーザー詳細ページ</br>
[![Image from Gyazo](https://i.gyazo.com/34a7b12918c887f4c2c54ec6f5fd59e0.gif)](https://gyazo.com/34a7b12918c887f4c2c54ec6f5fd59e0)

- カテゴリ選択し作品をランダム表示</br>
[![Image from Gyazo](https://i.gyazo.com/74999abdd6c1eb1a4e26d476511435ce.gif)](https://gyazo.com/74999abdd6c1eb1a4e26d476511435ce)

- カテゴリ選択し作品をランダム表示してから作品詳細ページへ遷移</br>
[![Image from Gyazo](https://i.gyazo.com/f8e155dd1ba9878122e007d5de0763aa.gif)](https://gyazo.com/f8e155dd1ba9878122e007d5de0763aa)
</br>

# 実装予定の機能
- 作品購入機能
- お気に入り機能

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_kana_name     | string | null: false               |
| first_kana_name    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :favorites
- has_many :comments
- has_many :orders

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| price               | integer    | null: false                    |
| explanation         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| size_id             | integer    | null: false                    |
| material_id         | integer    | null: false                    |
| color_id            | integer    | null: false                    |
| delivery_charge_id  | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| shipping_day_id     | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :favorites
- has_many :comments
- has_one :order

- belongs_to :category
- belongs_to :size
- belongs_to :material
- belongs_to :color
- belongs_to :delivery_charge
- belongs_to :prefecture
- belongs_to :shipping_day

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## favorites テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| user             | references  | null: false, foreign_key: true |
| item             | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## orders テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| user             | references  | null: false, foreign_key: true |
| item             | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| block            | string     | null: false                    |
| building         | string     |                                |
| telephone_number | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to :order
- belongs_to :prefecture
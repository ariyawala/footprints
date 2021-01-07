# Footprints(仮)概要

- URL: [https://footprints-32539.herokuapp.com/]
- github: [https://github.com/ariyawala/footprints]

1. 使用技術

- Ruby 2.6.5
- Ruby on Rails 6.0.3.4
- MySQL 5.6.5
- Rspec

2. 機能、非機能一覧

- ユーザー登録、ログイン機能（devise）
- 投稿機能
  - 画像投稿（ActiveStorage）
- コメント機能（Ajax）
- テスト
  - 単体テスト(model)

3. テーブル設計

### users table

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false               |
| encrypted_password | string | null: false               |
| nickname           | string | null: false, unique: true |
| birthday           | date   | null: false               |

#### Association

- has_many :articles
- has_many :comments

### articles table

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| title  | string     | null: false       |
| memo   | text       | null: false       |
| place  | string     | null: false       |
| date   | date       | null: false       |
| user   | references | foreign_key: true |

#### Association

- belongs_to :user
- has_many :comments

### comments table

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| text    | text       | null: false       |
| user    | references | foreign_key: true |
| article | references | foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :article

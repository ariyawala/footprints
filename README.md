# _Footprints_ (作成中)

## Overview

Footprints は写真と文章の共有アプリです。
投稿した記事を他のユーザーと共有し、それぞれの記事に対しコメントやいいねを残せます。

#### App URL

https://footprints-32539.herokuapp.com/

#### Usage (HTTPS)

https://github.com/ariyawala/footprints.git

## Description

### 1. 使用技術

- Ruby 2.6.5
- Ruby on Rails 6.0.3.4
- MySQL 5.6.5
- Rspec
- GitHub
- Heroku

### 2. 機能、非機能一覧

- ユーザー登録、ログイン機能（devise）
- 投稿機能
  - 記事投稿機能
  - 画像投稿（ActiveStorage）
- コメント機能
- いいね機能
- テスト
  - 単体テスト(model)

### 3. テーブル設計

##### users table

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false               |
| encrypted_password | string | null: false               |
| nickname           | string | null: false, unique: true |
| birthday           | date   | null: false               |

##### Association

- has_many :articles
- has_many :comments
- has_many :likes

##### articles table

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| title  | string     | null: false       |
| memo   | text       | null: false       |
| place  | string     | null: false       |
| date   | date       | null: false       |
| user   | references | foreign_key: true |

##### Association

- belongs_to :user
- has_many :comments
- has_many :likes

##### comments table

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| text    | text       | null: false       |
| user    | references | foreign_key: true |
| article | references | foreign_key: true |

##### Association

- belongs_to :user
- belongs_to :article

##### likes table

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| article | references | foreign_key: true |

##### Association

- belongs_to :user
- belongs_to :article

### ER 図

![ER](https://user-images.githubusercontent.com/75010949/105132425-40e05900-5b2e-11eb-8431-7291d7902c99.png)

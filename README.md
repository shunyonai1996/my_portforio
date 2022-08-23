# だいjobそ？

## アプリの概要
就職・転職志望者のミスマッチを防ぐアプリです。
職業ごとに１日の職務内容を閲覧、投稿できます。
現に職業に就いている方が「繁忙度」「経験年数」ごとに職務内容を投稿することで、これから就職や転職を考える方がこの情報を参考に閲覧することができます。

[ポートフォリオURL](https://daijobso.com "だいjobそ？")

## 使用技術一覧

【バックエンド】

- Ruby 3.1.0
- Ruby on Rails 6.1.6.1

【フロントエンド】

- HTML/CSS/JavaScript
- Vue.js

【テスト】

- Rspec

【インフラ】

- AWS( VPC, EC2, ACM, ALB, Route53)
- Nginx
- Puma
- MySQL 5.5.68

【バージョン管理】

- Git / GitHub

## ER図
![ER図](https://user-images.githubusercontent.com/78899768/186126606-ac1e998c-ff89-4a13-956e-f663a6799f9f.jpg)


## 機能一覧
- ユーザー機能
  - 新規登録
  - ログイン/ログアウト
  - マイページ編集（ユーザー名・メールアドレス・アイコン画像・自己紹介）
  - アカウント削除機能
  - ゲストログイン
- 投稿機能
  - 投稿一覧表示
  - 投稿追加/削除
- 検索機能
  - 業界と職種から絞り込み
- リアクション機能
  - いいね追加/削除
  - コメント追加/削除
- ブックマーク機能
  - 投稿に対してマイページに追加/解除
- フォロー機能
  - フォロー追加/解除
  - 一覧表示
- 管理者機能
  - 投稿削除
  - アカウント削除
  - コメント削除

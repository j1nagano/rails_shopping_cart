# README

# 作成した環境
- OS: CentOS Linux release 7.4.1708
- MariaDB server: 5.5.56
  - mariadb-devel-5.5.56-2.el7.x86\_64
  - mariadb-5.5.56-2.el7.x86\_64
  - mariadb-server-5.5.56-2.el7.x86\_64
  - mariadb-libs-5.5.56-2.el7.x86\_64
  - rootユーザのパスワードはuserになっています。変更する場合はdatabase.ymlを編集してください。
- Ruby: 2.4.2
  - rbenv: 1.1.1-6-g2d7cefe
- Rails: 5.1.4

# インストール
gitでソースをダウンロードしたフォルダに移動して、以下を実行してください。
  $ bundle install
  $ rake db:create
  $ rake db:migrate

管理アカウントの作成
  $ rake casein:users:create\_admin email=you@yourdomain.com password=your\_password
  => [Casein] Created new admin user with username 'admin' and password 'your\_password'
adminユーザが作成されます。

# 利用方法

- 管理画面
  - 管理者ログイン画面
    - http://your\_server\_ip:3000/casein/
  - 商品の追加、編集、削除
    - http://your\_server\_ip:3000/casein/items
  - ユーザ情報の編集、削除
    - http://your\_server\_ip:3000/casein/customers
- トップページ
  - http://your\_server\_ip:3000
  - 管理画面で追加した商品が列挙されます。
- ユーザ登録
  - トップページの左上にある「会員登録」リンクから登録できます

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby versiona 2.4.2

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

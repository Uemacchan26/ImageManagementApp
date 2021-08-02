### 動作環境
(詳細はこちらを参考：　https://qiita.com/kodai_0122/items/56168eaec28eb7b1b93b)
- Ruby 2.5.7
- Rails 5.2.3
- PostgreSQL

### 動作確認手順
以下、プロジェクトディレクトリ直下実行 & rails環境が構築できていることを想定
#### 1.データベース作成(初回のみ)
```$ rails db:create```
#### 2.railsサーバー起動
```
$ rails s

こうなったらOK
=> Booting Puma
=> Rails 5.2.3 application starting in development 
...（省略）...
* Listening on tcp://localhost:3000
Use Ctrl-C to stop
```
#### 3.ログインユーザー作成(railsコンソール経由で)
- railsコンソール起動
```
$ rails c
```
- ログインユーザーを作成するコマンド
```
User.create(id: 1, password: "password")
```
#### 4.ログインURLはこちら
```
ユーザーID: 1、password: "password"でログイン可能
http://localhost:3000/login
```

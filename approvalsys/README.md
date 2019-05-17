# README!!DDD

http://redmine.tci-cn.co.jp/redmine/attachments/1874/%E3%80%90%E6%89%8B%E9%A0%86%E3%80%91Ruby_on_rails%E3%83%AD%E3%83%BC%E3%82%AB%E3%83%AB%E7%92%B0%E5%A2%83%E6%A7%8B%E7%AF%89%E6%89%8B%E9%A0%86.xlsx


# vue適用
- nodejs
    - 10.15.3 LTS 推奨版
    - https://nodejs.org/ja/
- yarn
    - OSよりインストール方法がそれぞれ
    - https://yarnpkg.com/ja/docs/install#mac-stable
- rails
    - 5.x 系

# 手順
- approvalSysの手順

    - yarn をインストール `https://yarnpkg.com/ja/docs/install`
    - 新しいCMDで以下を実行
        - ` bundle install` 
        - ` yarn install `
        -  `rails db:migrate`
        -  `rails s`

- おまけに(RailsでVueJSを適用)
    - rails/webpackerのインストール
        - https://github.com/rails/webpacker
        - （通訳版）https://techracho.bpsinc.jp/hachi8833/2018_05_24/56977
    - 新規Rails Appの場合
        - rails new myapp --webpack=vue
    - 既存Rails Appの場合
        - Gemfileに下記を追加、` bundler install ` を実行    
        ` gem 'webpacker', '~> 4.x' `
    - 詳細は https://github.com/rails/webpacker を参照
    - vuejsのパッケージはpackage.jsonの中に記載されてる  
    パッケージをインストールには ` yarn install `を実行
        - パッケージ追加 `yarn add packagename`
        - パッケージ削除 `yarn remove packagename`
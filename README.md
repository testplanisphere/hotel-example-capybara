# hotel-example-capybara

![capybara](https://github.com/testplanisphere/hotel-example-capybara/workflows/capybara/badge.svg)

このプロジェクトはテスト自動化学習のためのサンプルコードです。
This project is example codes for learning test automation.

### テスト対象 / Test Object

https://hotel.testplanisphere.dev/

### 概要 / Overview

#### プログラミング言語 / Programming Language

* Ruby

#### 自動化フレームワーク / Automation Framework

* [Capybara](https://teamcapybara.github.io/capybara/)
* [SitePrism](https://github.com/site-prism/site_prism)

#### テスティングフレームワーク / Testing Framework

* [RSpec](https://rspec.info/)

#### ビルドツール / Build Tool

* [Rake](https://ruby.github.io/rake/)
* [Bundler](https://bundler.io/)

#### 静的解析ツール / Lint Tool

* [RuboCop](https://docs.rubocop.org/)

### 実行方法 / How to Run

#### 必須環境 / Requirements

* Ruby 2.6
* Google Chrome

#### 依存ライブラリのインストール / Install Dependencies

```
gem install bundler
bundle install
```

#### テストの実行 / Run Tests

```
bundle exec rake
```

#### 静的解析の実行 / Run Lint

```
bundle exec rake rubocop
```

### 変更履歴 / Changelog

#### v2020.6.0 (2020-06-30)

* [#20](https://github.com/testplanisphere/hotel-example-capybara/pull/20) Bump webdrivers from 4.3.0 to 4.4.0
* [#21](https://github.com/testplanisphere/hotel-example-capybara/pull/21) Bump rubocop from 0.84.0 to 0.85.0
* [#22](https://github.com/testplanisphere/hotel-example-capybara/pull/22) Bump webdrivers from 4.4.0 to 4.4.1
* [#24](https://github.com/testplanisphere/hotel-example-capybara/pull/24) *Security* Bump rack from 2.2.2 to 2.2.3
* [#25](https://github.com/testplanisphere/hotel-example-capybara/pull/25) Bump capybara from 3.32.2 to 3.33.0
* [#26](https://github.com/testplanisphere/hotel-example-capybara/pull/26) Bump rubocop from 0.85.0 to 0.86.0

#### v1.2.0 (2020-05-31)

* [#12](https://github.com/testplanisphere/hotel-example-capybara/pull/12) webdrivers gemを導入
* [#14](https://github.com/testplanisphere/hotel-example-capybara/pull/14) Dependabotを導入
* [#15](https://github.com/testplanisphere/hotel-example-capybara/pull/15) Bump rubocop from 0.82.0 to 0.84.0
* [#16](https://github.com/testplanisphere/hotel-example-capybara/pull/16) Bump capybara from 3.32.1 to 3.32.2
* [#18](https://github.com/testplanisphere/hotel-example-capybara/pull/18) Github actions/cacheをv2にアップデート

#### v1.1.0 (2020-04-29)

* [#3](https://github.com/testplanisphere/hotel-example-capybara/pull/3) Github ActionsにmacOSとWindowsランナーを追加
* [#6](https://github.com/testplanisphere/hotel-example-capybara/pull/6) テストデータのアドレスをexample.comに修正
* [#7](https://github.com/testplanisphere/hotel-example-capybara/pull/7) 日付入力が空の場合のテストを追加
* [#9](https://github.com/testplanisphere/hotel-example-capybara/pull/9) windowsクローズのアサーションを修正

#### v1.0.0 (2020-04-23)

* 正式リリース

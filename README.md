# hotel-example-capybara-ja

[![capybara-ja](https://github.com/testplanisphere/hotel-example-capybara-ja/actions/workflows/test.yml/badge.svg)](https://github.com/testplanisphere/hotel-example-capybara-ja/actions/workflows/test.yml)

このプロジェクトはテスト自動化学習のためのサンプルコードです。

### テスト対象

https://hotel.testplanisphere.dev/ja/

### 概要

#### プログラミング言語

* Ruby

#### 自動化フレームワーク

* [Capybara](https://teamcapybara.github.io/capybara/)
* [SitePrism](https://github.com/site-prism/site_prism)

#### テスティングフレームワーク

* [RSpec](https://rspec.info/)

#### ビルドツール

* [Rake](https://ruby.github.io/rake/)
* [Bundler](https://bundler.io/)

#### 静的解析ツール

* [RuboCop](https://docs.rubocop.org/)

### 実行方法

#### 必須環境

* Ruby 2.6
* Google Chrome

#### 依存ライブラリのインストール

```
gem install bundler
bundle install
```

#### テストの実行

```
bundle exec rake
```

#### 静的解析の実行

```
bundle exec rake rubocop
```

### 変更履歴

#### v2021.2.0 (2021-02-28)

* [#47](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/47) Bump site_prism from 3.4.2 to 3.7
* [#50](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/50) Bump rspec from 3.9.0 to 3.10.0
* [#61](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/61) Bump rake from 13.0.1 to 13.0.3
* [#67](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/67) Bump capybara from 3.33.0 to 3.35.3
* [#68](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/68) Bump rubocop from 0.92.0 to 1.9.1
* [#71](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/71) Update branch name
* [#72](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/72) Update cache setting
* [#73](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/73) Bump webdrivers from 4.4.1 to 4.5.0
* [#74](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/74) Bump ruby from 2.6 to 2.7
* [#75](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/75) Bump rubocop from 1.9.1 to 1.10.0
* [#76](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/76) Bump site_prism from 3.7 to 3.7.1

#### v2020.9.0 (2020-09-30)

* [#42](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/42) Bump rubocop from 0.89.1 to 0.91.1
* [#43](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/43) Bump rubocop from 0.91.1 to 0.92.0

#### v2020.8.0 (2020-08-31)

* [#38](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/38) Bump rubocop from 0.88.0 to 0.89.1

#### v2020.7.0 (2020-07-26)

* [#30](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/30) Bump rubocop from 0.86.0 to 0.88.0
* [#31](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/31) Update Dependabot config file
* [#32](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/32) update actions and dependabot
* [#35](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/35) move to ja site

#### v2020.6.0 (2020-06-30)

* [#20](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/20) Bump webdrivers from 4.3.0 to 4.4.0
* [#21](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/21) Bump rubocop from 0.84.0 to 0.85.0
* [#22](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/22) Bump webdrivers from 4.4.0 to 4.4.1
* [#24](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/24) *Security* Bump rack from 2.2.2 to 2.2.3
* [#25](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/25) Bump capybara from 3.32.2 to 3.33.0
* [#26](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/26) Bump rubocop from 0.85.0 to 0.86.0

#### v1.2.0 (2020-05-31)

* [#12](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/12) webdrivers gemを導入
* [#14](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/14) Dependabotを導入
* [#15](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/15) Bump rubocop from 0.82.0 to 0.84.0
* [#16](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/16) Bump capybara from 3.32.1 to 3.32.2
* [#18](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/18) Github actions/cacheをv2にアップデート

#### v1.1.0 (2020-04-29)

* [#3](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/3) Github ActionsにmacOSとWindowsランナーを追加
* [#6](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/6) テストデータのアドレスをexample.comに修正
* [#7](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/7) 日付入力が空の場合のテストを追加
* [#9](https://github.com/testplanisphere/hotel-example-capybara-ja/pull/9) windowsクローズのアサーションを修正

#### v1.0.0 (2020-04-23)

* 正式リリース

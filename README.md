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
* [ChromeDriver](https://chromedriver.chromium.org/downloads)

ChromeDriverはダウンロードして環境変数`PATH`の通った場所に置いてください。
Download Chromedriver and place it in the System `PATH`.

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

#### v1.0.0 (2020-04-23)

* 正式リリース

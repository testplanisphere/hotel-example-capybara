## hotel-example-capybara

### テスト対象サイト

https://hotel.testplanisphere.dev/

### 概要

#### フレームワーク

* [Capybara](https://teamcapybara.github.io/capybara/)
* [SitePrism](https://github.com/site-prism/site_prism)

#### プログラミング言語

Ruby

#### テスティングフレームワーク

* [RSpec](https://rspec.info/)

#### ビルドツール

* [Rake](https://ruby.github.io/rake/)
* [Bundler](https://bundler.io/)

#### 静的解析ツール

* [RuboCop](https://docs.rubocop.org/)

### 実行方法

#### 必須環境

* Ruby 2.7以上
* Google Chrome
* [ChromeDriver](https://chromedriver.chromium.org/downloads)


ChromeDriverはダウンロード・展開して環境変数`PATH`の通った場所においてください。

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
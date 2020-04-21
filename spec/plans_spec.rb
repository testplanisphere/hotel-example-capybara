# frozen_string_literal: true

feature 'プラン一覧' do
  given(:app) { App.new }

  scenario '未ログイン状態でプラン一覧が表示されること' do
    app.top.load
    app.top.nav.plan_link.click
    app.plans.when_loaded do |page|
      plan_titles = page.plan_titles

      expect(plan_titles.size).to eq(7)
      expect(plan_titles[0]).to have_text('お得な特典付きプラン')
      expect(plan_titles[1]).to have_text('素泊まり')
      expect(plan_titles[2]).to have_text('出張ビジネスプラン')
      expect(plan_titles[3]).to have_text('エステ・マッサージプラン')
      expect(plan_titles[4]).to have_text('貸し切り露天風呂プラン')
      expect(plan_titles[5]).to have_text('カップル限定プラン')
      expect(plan_titles[6]).to have_text('テーマパーク優待プラン')
    end
  end

  scenario '一般会員でログイン状態でプラン一覧が表示されること' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'sakura@example.com'
    app.login.password.set 'pass1234'
    app.login.submit.click
    app.my_page.nav.plan_link.click
    app.plans.when_loaded do |page|
      plan_titles = page.plan_titles

      expect(plan_titles.size).to eq(9)
      expect(plan_titles[0]).to have_text('お得な特典付きプラン')
      expect(plan_titles[1]).to have_text('ディナー付きプラン')
      expect(plan_titles[2]).to have_text('お得なプラン')
      expect(plan_titles[3]).to have_text('素泊まり')
      expect(plan_titles[4]).to have_text('出張ビジネスプラン')
      expect(plan_titles[5]).to have_text('エステ・マッサージプラン')
      expect(plan_titles[6]).to have_text('貸し切り露天風呂プラン')
      expect(plan_titles[7]).to have_text('カップル限定プラン')
      expect(plan_titles[8]).to have_text('テーマパーク優待プラン')
    end
  end

  scenario 'プレミアム会員でログイン状態でプラン一覧が表示されること' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'ichiro@example.com'
    app.login.password.set 'password'
    app.login.submit.click
    app.my_page.nav.plan_link.click
    app.plans.when_loaded do |page|
      plan_titles = page.plan_titles

      expect(plan_titles.size).to eq(10)
      expect(plan_titles[0]).to have_text('お得な特典付きプラン')
      expect(plan_titles[1]).to have_text('プレミアムプラン')
      expect(plan_titles[2]).to have_text('ディナー付きプラン')
      expect(plan_titles[3]).to have_text('お得なプラン')
      expect(plan_titles[4]).to have_text('素泊まり')
      expect(plan_titles[5]).to have_text('出張ビジネスプラン')
      expect(plan_titles[6]).to have_text('エステ・マッサージプラン')
      expect(plan_titles[7]).to have_text('貸し切り露天風呂プラン')
      expect(plan_titles[8]).to have_text('カップル限定プラン')
      expect(plan_titles[9]).to have_text('テーマパーク優待プラン')
    end
  end
end

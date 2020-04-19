# frozen_string_literal: true

require 'date'
require 'pathname'

feature 'マイページ' do
  given(:app) { App.new }

  scenario '定義済みユーザの情報が表示されること_ichiro' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'ichiro@example.com'
    app.login.password.set 'password'
    app.login.submit.click

    expect(app.my_page.email).to have_text('ichiro@example.com')
    expect(app.my_page.username).to have_text('山田一郎')
    expect(app.my_page.rank).to have_text('プレミアム会員')
    expect(app.my_page.address).to have_text('東京都豊島区池袋')
    expect(app.my_page.tel).to have_text('01234567891')
    expect(app.my_page.gender).to have_text('男性')
    expect(app.my_page.birthday).to have_text('未登録')
    expect(app.my_page.notification).to have_text('受け取る')
  end

  scenario '定義済みユーザの情報が表示されること_sakura' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'sakura@example.com'
    app.login.password.set 'pass1234'
    app.login.submit.click

    expect(app.my_page.email).to have_text('sakura@example.com')
    expect(app.my_page.username).to have_text('松本さくら')
    expect(app.my_page.rank).to have_text('一般会員')
    expect(app.my_page.address).to have_text('神奈川県横浜市鶴見区大黒ふ頭')
    expect(app.my_page.tel).to have_text('未登録')
    expect(app.my_page.gender).to have_text('女性')
    expect(app.my_page.birthday).to have_text('2000年4月1日')
    expect(app.my_page.notification).to have_text('受け取らない')
  end

  scenario '定義済みユーザの情報が表示されること_jun' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'jun@example.com'
    app.login.password.set 'pa55w0rd!'
    app.login.submit.click

    expect(app.my_page.email).to have_text('jun@example.com')
    expect(app.my_page.username).to have_text('林潤')
    expect(app.my_page.rank).to have_text('プレミアム会員')
    expect(app.my_page.address).to have_text('大阪府大阪市北区梅田')
    expect(app.my_page.tel).to have_text('01212341234')
    expect(app.my_page.gender).to have_text('その他')
    expect(app.my_page.birthday).to have_text('1988年12月17日')
    expect(app.my_page.notification).to have_text('受け取らない')
  end

  scenario '定義済みユーザの情報が表示されること_yoshiki' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'yoshiki@example.com'
    app.login.password.set 'pass-pass'
    app.login.submit.click

    expect(app.my_page.email).to have_text('yoshiki@example.com')
    expect(app.my_page.username).to have_text('木村良樹')
    expect(app.my_page.rank).to have_text('一般会員')
    expect(app.my_page.address).to have_text('未登録')
    expect(app.my_page.tel).to have_text('01298765432')
    expect(app.my_page.gender).to have_text('未登録')
    expect(app.my_page.birthday).to have_text('1992年8月31日')
    expect(app.my_page.notification).to have_text('受け取る')
  end

  scenario '新規登録したユーザの情報が表示されること' do
    app.top.load
    app.top.nav.signup_link.click
    app.signup.email.set 'new-user@gmail.com'
    app.signup.password.set '11111111'
    app.signup.password_confirmation.set '11111111'
    app.signup.username.set '田中花子'
    app.signup.rank_normal.set true
    app.signup.address.set '神奈川県横浜市港区'
    app.signup.tel.set '09876543211'
    app.signup.gender.select '女性'
    app.signup.birthday.set Date.new(2000, 1, 1)
    app.signup.notification.set false
    app.signup.submit.click

    expect(app.my_page.email).to have_text('new-user@gmail.com')
    expect(app.my_page.username).to have_text('田中花子')
    expect(app.my_page.rank).to have_text('一般会員')
    expect(app.my_page.address).to have_text('神奈川県横浜市港区')
    expect(app.my_page.tel).to have_text('09876543211')
    expect(app.my_page.gender).to have_text('女性')
    expect(app.my_page.birthday).to have_text('2000年1月1日')
    expect(app.my_page.notification).to have_text('受け取らない')
  end

  scenario 'アイコン設定で画像以外のファイルはエラーとなること' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'new-user@gmail.com'
    app.login.password.set '11111111'
    app.login.submit.click
    app.my_page.icon_link.click
    file_path = Pathname(__FILE__).expand_path + '..' + 'uploadfiles' + 'dummy.txt'
    app.icon.icon.set file_path.to_s

    expect(app.icon.icon_message).to have_text('画像ファイルを選択してください。')
  end

  scenario 'アイコン設定で10KBを越えるファイルはエラーとなること' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'new-user@gmail.com'
    app.login.password.set '11111111'
    app.login.submit.click
    app.my_page.icon_link.click
    file_path = Pathname(__FILE__).expand_path + '..' + 'uploadfiles' + '240x240_12.png'
    app.icon.icon.set file_path.to_s

    expect(app.icon.icon_message).to have_text('ファイルサイズは10KB以下にしてください。')
  end

  scenario '設定したアイコンがマイページに表示されること' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'new-user@gmail.com'
    app.login.password.set '11111111'
    app.login.submit.click
    app.my_page.icon_link.click
    file_path = Pathname(__FILE__).expand_path + '..' + 'uploadfiles' + '240x240_01.png'
    app.icon.icon.set file_path.to_s
    app.icon.zoom.set 80
    app.icon.color.set '#000000'
    app.icon.submit.click

    expect(app.my_page).to have_icon_image
    expect(app.my_page.icon_image['width']).to eq('70')
    expect(app.my_page.icon_image).to match_style('backgroundColor' => 'rgba(0, 0, 0, 1)')
  end

  scenario '新規登録したユーザが削除できること' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'new-user@gmail.com'
    app.login.password.set '11111111'
    app.login.submit.click

    confirm_message = accept_confirm do
      alert_message = accept_alert do
        app.my_page.delete.click
      end
      expect(alert_message).to eq("退会すると全ての情報が削除されます。\nよろしいですか？")
    end

    expect(confirm_message).to eq('退会処理を完了しました。ご利用ありがとうございました。')
    expect(current_url).to include('index.html')
  end
end

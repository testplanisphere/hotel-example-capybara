# frozen_string_literal: true

feature 'ログイン' do
  given(:app) { App.new }

  scenario '定義済みユーザでログインができること' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'ichiro@example.com'
    app.login.password.set 'password'
    app.login.submit.click

    expect(app.my_page.header).to have_text('マイページ')
  end

  scenario '未入力でエラーとなること' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set ''
    app.login.password.set ''
    app.login.submit.click

    expect(app.login.email_message).to have_text('このフィールドを入力してください。')
    expect(app.login.password_message).to have_text('このフィールドを入力してください。')
  end

  scenario '未登録のユーザでエラーとなること' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'error@example.com'
    app.login.password.set 'error'
    app.login.submit.click

    expect(app.login.email_message).to have_text('メールアドレスまたはパスワードが違います。')
    expect(app.login.password_message).to have_text('メールアドレスまたはパスワードが違います。')
  end
end

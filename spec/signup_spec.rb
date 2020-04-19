# frozen_string_literal: true

require 'date'

feature '登録画面' do
  given(:app) { App.new }

  scenario 'ユーザの新規登録ができること' do
    app.top.load
    app.top.signup_link.click
    app.signup.email.set 'new-user@gmail.com'
    app.signup.password.set 'password'
    app.signup.password_confirmation.set 'password'
    app.signup.username.set '新規ユーザ１'
    app.signup.rank_normal.set true
    app.signup.address.set '神奈川県横浜市港区'
    app.signup.tel.set '01234567891'
    app.signup.gender.select '女性'
    app.signup.birthday.set Date.new(2000, 1, 1)
    app.signup.notification.set true
    app.signup.submit.click

    expect(app.my_page.header).to have_text('マイページ')
  end

  scenario '必須項目を未入力にするとエラーとなること' do
    app.top.load
    app.top.signup_link.click
    app.signup.email.set ''
    app.signup.password.set ''
    app.signup.password_confirmation.set ''
    app.signup.username.set ''
    app.signup.rank_premium.set true
    app.signup.address.set ''
    app.signup.tel.set ''
    app.signup.gender.select '回答しない'
    app.signup.birthday.set Date.new(2000, 1, 1)
    app.signup.notification.set false
    app.signup.submit.click

    expect(app.signup.email_message).to have_text('このフィールドを入力してください。')
    expect(app.signup.password_message).to have_text('このフィールドを入力してください。')
    expect(app.signup.password_confirmation_message).to have_text('このフィールドを入力してください。')
    expect(app.signup.username_message).to have_text('このフィールドを入力してください。')
    expect(app.signup).to have_no_address_message
    expect(app.signup).to have_no_tel_message
    expect(app.signup).to have_no_gender_message
    expect(app.signup).to have_no_birthday_message
  end

  scenario '指定のフォーマット外の入力でエラーとなること' do
    app.top.load
    app.top.signup_link.click
    app.signup.email.set 'a'
    app.signup.password.set '1234567'
    app.signup.password_confirmation.set '1'
    app.signup.username.set 'テストテスト'
    app.signup.rank_normal.set true
    app.signup.address.set '千葉県千葉市'
    app.signup.tel.set '1234567890'
    app.signup.gender.select 'その他'
    app.signup.birthday.set Date.new(2000, 1, 1)
    app.signup.notification.set true
    app.signup.submit.click

    expect(app.signup.email_message).to have_text('メールアドレスを入力してください。')
    expect(app.signup.password_message).to have_text('8文字以上で入力してください。')
    expect(app.signup.password_confirmation_message).to have_text('8文字以上で入力してください。')
    expect(app.signup).to have_no_username_message
    expect(app.signup).to have_no_address_message
    expect(app.signup.tel_message).to have_text('指定されている形式で入力してください。')
    expect(app.signup).to have_no_gender_message
    expect(app.signup).to have_no_birthday_message
  end

  scenario '登録済みのメールアドレスはエラーとなること' do
    app.top.load
    app.top.signup_link.click
    app.signup.email.set 'new-user@gmail.com'
    app.signup.password.set 'password'
    app.signup.password_confirmation.set 'password'
    app.signup.username.set '新規ユーザ１'
    app.signup.rank_normal.set true
    app.signup.address.set '神奈川県横浜市港区'
    app.signup.tel.set '01234567891'
    app.signup.gender.select '女性'
    app.signup.birthday.set Date.new(2000, 1, 1)
    app.signup.notification.set true
    app.signup.submit.click

    expect(app.signup.email_message).to have_text('このメールアドレスはすでに登録済みです。')
  end

  scenario '登録済みのメールアドレスはエラーとなること' do
    app.top.load
    app.top.signup_link.click
    app.signup.email.set 'new-user@gmail.com'
    app.signup.password.set 'password'
    app.signup.password_confirmation.set '123456789'
    app.signup.username.set '新規ユーザ１'
    app.signup.rank_normal.set true
    app.signup.address.set '神奈川県横浜市港区'
    app.signup.tel.set '01234567891'
    app.signup.gender.select '女性'
    app.signup.birthday.set Date.new(2000, 1, 1)
    app.signup.notification.set true
    app.signup.submit.click

    expect(app.signup.password_confirmation_message).to have_text('入力されたパスワードと一致しません。')
  end
end

# frozen_string_literal: true

require 'date'

feature '宿泊予約画面' do
  given(:app) { App.new }

  scenario '画面表示時の初期値が設定されていること_未ログイン' do
    app.top.load
    app.top.nav.plan_link.click
    reserve_window = window_opened_by do
      app.plans.when_loaded do |page|
        page.plans.find { |p| p.find('.card-title').text == 'お得な特典付きプラン' }.find('a').click
      end
    end
    within_window reserve_window do
      tomorrow = Date.today.next_day.strftime('%Y/%m/%d')
      expect(app.reserve.plan_name).to have_text('お得な特典付きプラン')
      expect(app.reserve.reserve_date.value).to eq(tomorrow)
      expect(app.reserve.reserve_term.value).to eq('1')
      expect(app.reserve.head_count.value).to eq('1')
      expect(app.reserve).to have_no_email
      expect(app.reserve).to have_no_tel
      app.reserve.contact.select 'メールでのご連絡'
      expect(app.reserve).to have_email
      expect(app.reserve).to have_no_tel
      expect(app.reserve.email.value).to be_empty
      app.reserve.contact.select '電話でのご連絡'
      expect(app.reserve).to have_no_email
      expect(app.reserve).to have_tel
      expect(app.reserve.tel.value).to be_empty
      app.reserve.room_frame do |frame|
        expect(frame.header).to have_text('スタンダードツイン')
      end
    end
  end

  scenario '画面表示時の初期値が設定されていること_ログイン済み' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'ichiro@example.com'
    app.login.password.set 'password'
    app.login.submit.click
    app.my_page.nav.plan_link.click
    reserve_window = window_opened_by do
      app.plans.when_loaded do |page|
        page.plans.find { |p| p.find('.card-title').text == 'プレミアムプラン' }.find('a').click
      end
    end
    within_window reserve_window do
      tomorrow = Date.today.next_day.strftime('%Y/%m/%d')
      expect(app.reserve.plan_name).to have_text('プレミアムプラン')
      expect(app.reserve.reserve_date.value).to eq(tomorrow)
      expect(app.reserve.reserve_term.value).to eq('1')
      expect(app.reserve.head_count.value).to eq('2')
      expect(app.reserve.username.value).to eq('山田一郎')
      expect(app.reserve).to have_no_email
      expect(app.reserve).to have_no_tel
      app.reserve.contact.select 'メールでのご連絡'
      expect(app.reserve).to have_email
      expect(app.reserve).to have_no_tel
      expect(app.reserve.email.value).to eq('ichiro@example.com')
      app.reserve.contact.select '電話でのご連絡'
      expect(app.reserve).to have_no_email
      expect(app.reserve).to have_tel
      expect(app.reserve.tel.value).to eq('01234567891')
      app.reserve.room_frame do |frame|
        expect(frame.header).to have_text('プレミアムツイン')
      end
    end
  end

  scenario '入力値が空白でエラーとなること' do
    app.top.load
    app.top.nav.plan_link.click
    reserve_window = window_opened_by do
      app.plans.when_loaded do |page|
        page.plans.find { |p| p.find('.card-title').text == 'お得な特典付きプラン' }.find('a').click
      end
    end
    within_window reserve_window do
      sleep 1
      app.reserve.reserve_date.set ''
      sleep 1
      app.reserve.date_picker_close.click
      app.reserve.reserve_term.set ''
      app.reserve.head_count.set ''
      app.reserve.username.set 'テスト太郎'  # move focus

      expect(app.reserve.reserve_date_message).to have_text('このフィールドを入力してください。')
      expect(app.reserve.reserve_term_message).to have_text('このフィールドを入力してください。')
      expect(app.reserve.head_count_message).to have_text('このフィールドを入力してください。')
    end
  end

  scenario '不正な入力値でエラーとなること_小' do
    app.top.load
    app.top.nav.plan_link.click
    reserve_window = window_opened_by do
      app.plans.when_loaded do |page|
        page.plans.find { |p| p.find('.card-title').text == 'お得な特典付きプラン' }.find('a').click
      end
    end
    within_window reserve_window do
      today = Date.today.strftime('%Y/%m/%d')
      app.reserve.reserve_date.set ''
      sleep 1
      app.reserve.reserve_date.set today
      app.reserve.date_picker_close.click
      app.reserve.reserve_term.set '0'
      app.reserve.head_count.set '0'
      app.reserve.username.set 'テスト太郎'  # move focus

      expect(app.reserve.reserve_date_message).to have_text('翌日以降の日付を入力してください。')
      expect(app.reserve.reserve_term_message).to have_text('1以上の値を入力してください。')
      expect(app.reserve.head_count_message).to have_text('1以上の値を入力してください。')
    end
  end

  scenario '不正な入力値でエラーとなること_大' do
    app.top.load
    app.top.nav.plan_link.click
    reserve_window = window_opened_by do
      app.plans.when_loaded do |page|
        page.plans.find { |p| p.find('.card-title').text == 'お得な特典付きプラン' }.find('a').click
      end
    end
    within_window reserve_window do
      after90 = Date.today.next_day(91).strftime('%Y/%m/%d')
      app.reserve.reserve_date.set ''
      sleep 1
      app.reserve.reserve_date.set after90
      app.reserve.date_picker_close.click
      app.reserve.reserve_term.set '10'
      app.reserve.head_count.set '10'
      app.reserve.username.set 'テスト太郎'  # move focus

      expect(app.reserve.reserve_date_message).to have_text('3ヶ月以内の日付を入力してください。')
      expect(app.reserve.reserve_term_message).to have_text('9以下の値を入力してください。')
      expect(app.reserve.head_count_message).to have_text('9以下の値を入力してください。')
    end
  end

  scenario '不正な入力値でエラーとなること_文字列' do
    app.top.load
    app.top.nav.plan_link.click
    reserve_window = window_opened_by do
      app.plans.when_loaded do |page|
        page.plans.find { |p| p.find('.card-title').text == 'お得な特典付きプラン' }.find('a').click
      end
    end
    within_window reserve_window do
      app.reserve.reserve_date.set ''
      sleep 1
      app.reserve.reserve_date.set '12/3//345'
      app.reserve.date_picker_close.click
      app.reserve.reserve_term.set 'a' # cannot input
      app.reserve.head_count.set 'a' # cannnot input
      app.reserve.username.set 'テスト太郎' # move focus

      expect(app.reserve.reserve_date_message).to have_text('有効な値を入力してください。')
      expect(app.reserve.reserve_term_message).to have_text('このフィールドを入力してください。')
      expect(app.reserve.head_count_message).to have_text('このフィールドを入力してください。')
    end
  end

  scenario '不正な入力値でエラーとなること_確定時_メール選択' do
    app.top.load
    app.top.nav.plan_link.click
    reserve_window = window_opened_by do
      app.plans.when_loaded do |page|
        page.plans.find { |p| p.find('.card-title').text == 'お得な特典付きプラン' }.find('a').click
      end
    end
    within_window reserve_window do
      app.reserve.username.set ''
      app.reserve.contact.select 'メールでのご連絡'
      app.reserve.email.set ''
      app.reserve.submit.click

      expect(app.reserve.username_message).to have_text('このフィールドを入力してください。')
      expect(app.reserve.email_message).to have_text('このフィールドを入力してください。')
    end
  end

  scenario '不正な入力値でエラーとなること_確定時_電話選択' do
    app.top.load
    app.top.nav.plan_link.click
    reserve_window = window_opened_by do
      app.plans.when_loaded do |page|
        page.plans.find { |p| p.find('.card-title').text == 'お得な特典付きプラン' }.find('a').click
      end
    end
    within_window reserve_window do
      app.reserve.username.set ''
      app.reserve.contact.select '電話でのご連絡'
      app.reserve.tel.set ''
      app.reserve.submit.click

      expect(app.reserve.username_message).to have_text('このフィールドを入力してください。')
      expect(app.reserve.tel_message).to have_text('このフィールドを入力してください。')
    end
  end

  scenario '宿泊予約が完了すること_未ログイン_初期値' do
    app.top.load
    app.top.nav.plan_link.click
    reserve_window = window_opened_by do
      app.plans.when_loaded do |page|
        page.plans.find { |p| p.find('.card-title').text == 'お得な特典付きプラン' }.find('a').click
      end
    end
    within_window reserve_window do
      expected_start = Date.today.next_day
      expected_end = Date.today.next_day(2)
      expected_total_bill = if expected_start.sunday? || expected_start.saturday?
                              '合計 8,750円（税込み）'
                            else
                              '合計 7,000円（税込み）'
                            end
      expected_term = "#{expected_start.strftime('%Y年%-m月%-d日')} 〜 #{expected_end.strftime('%Y年%-m月%-d日')} 1泊"

      app.reserve.username.set 'テスト太郎'
      app.reserve.contact.select '希望しない'
      app.reserve.submit.click

      expect(app.confirm.total_bill).to have_text(expected_total_bill)
      expect(app.confirm.plan_name).to have_text('お得な特典付きプラン')
      expect(app.confirm.term).to have_text(expected_term)
      expect(app.confirm.head_count).to have_text('1名様')
      expect(app.confirm.plans).to have_text('なし')
      expect(app.confirm.username).to have_text('テスト太郎様')
      expect(app.confirm.contact).to have_text('希望しない')
      expect(app.confirm.comment).to have_text('なし')

      app.confirm.confirm.click
      app.confirm.wait_until_success_modal_visible
      expect(app.confirm.modal_message).to have_text('ご来館、心よりお待ちしております。')
      sleep 1
      app.confirm.close.click
      expect(current_window).to become_closed
    end
  end

  scenario '宿泊予約が完了すること_ログイン' do
    app.top.load
    app.top.nav.login_link.click
    app.login.email.set 'ichiro@example.com'
    app.login.password.set 'password'
    app.login.submit.click
    app.my_page.nav.plan_link.click
    reserve_window = window_opened_by do
      app.plans.when_loaded do |page|
        page.plans.find { |p| p.find('.card-title').text == 'プレミアムプラン' }.find('a').click
      end
    end
    within_window reserve_window do
      expected_start = Date.today.next_day(90)
      expected_end = Date.today.next_day(92)
      expected_total_bill = if expected_start.saturday?
                              '合計 112,000円（税込み）'
                            elsif expected_start.sunday? || expected_start.friday?
                              '合計 102,000円（税込み）'
                            else
                              '合計 92,000円（税込み）'
                            end
      expected_term = "#{expected_start.strftime('%Y年%-m月%-d日')} 〜 #{expected_end.strftime('%Y年%-m月%-d日')} 2泊"

      app.reserve.reserve_term.set ''
      app.reserve.reserve_term.set '2'
      app.reserve.head_count.set ''
      app.reserve.head_count.set '4'
      app.reserve.breakfast_plan.set true
      app.reserve.early_check_in_plan.set true
      app.reserve.sightseeing_plan.set false
      app.reserve.contact.select 'メールでのご連絡'
      app.reserve.comment.set "あああ\n\nいいいいいいい\nうう"
      app.reserve.reserve_date.set expected_start.strftime('%Y/%m/%d')
      app.reserve.date_picker_close.click
      app.reserve.submit.click

      expect(app.confirm.total_bill).to have_text(expected_total_bill)
      expect(app.confirm.plan_name).to have_text('プレミアムプラン')
      expect(app.confirm.term).to have_text(expected_term)
      expect(app.confirm.head_count).to have_text('4名様')
      expect(app.confirm.plans.text).to include('朝食バイキング')
      expect(app.confirm.plans.text).to include('昼からチェックインプラン')
      expect(app.confirm.plans.text).not_to include('お得な観光プラン')
      expect(app.confirm.username).to have_text('山田一郎様')
      expect(app.confirm.contact).to have_text('メール：ichiro@example.com')
      expect(app.confirm.comment).to have_text("あああ\n\nいいいいいいい\nうう")

      app.confirm.confirm.click
      app.confirm.wait_until_success_modal_visible
      expect(app.confirm.modal_message).to have_text('ご来館、心よりお待ちしております。')
      sleep 1
      app.confirm.close.click
      expect(current_window).to become_closed
    end
  end
end

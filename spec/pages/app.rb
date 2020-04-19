# frozen_string_literal: true

require 'pages/top_page'
require 'pages/login_page'
require 'pages/signup_page'
require 'pages/my_page'

class App
  def top
    Top.new
  end

  def login
    Login.new
  end

  def signup
    Signup.new
  end

  def my_page
    My.new
  end
end

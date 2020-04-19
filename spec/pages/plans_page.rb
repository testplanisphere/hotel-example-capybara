# frozen_string_literal: true

class Plans < SitePrism::Page
  section :nav, Nav
  element :loading, '#plan-list > div[role="status"]'
  elements :plan_titles, '.card-title'
  load_validation { has_no_loading? }
end

require 'rails_helper'

RSpec.feature "Pages", type: :feature do
  scenario 'home page' do
    visit "/"
    expect(page).to have_title "Llevatelo"

    within :css, ".navbar" do
      expect(page).to have_css('a.navbar-brand', text: 'Llevatelo.co')
      expect(page).to have_selector('.navbar-right')
      expect(page).to have_selector('.page-scroll', count: 3)
      expect(page).to have_selector('.page-scroll', text: 'Acerca de')
      expect(page).to have_selector('.sign-in a', text: 'Login')
   end
  end
end

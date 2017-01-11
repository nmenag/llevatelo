require 'rails_helper'

RSpec.feature "Pages", type: :feature do
  scenario 'home page' do
    visit root_path
    expect(page).to have_title "Llevatelo"

    within :css, '.navbar' do
      expect(page).to have_css('a.navbar-brand', text: 'Llevatelo.co')
      expect(page).to have_css('.navbar-right')
      expect(page).to have_css('.page-scroll', count: 3)
      expect(page).to have_css('.page-scroll', text: 'Acerca de')
      expect(page).to have_css('.sign-in a', text: 'Login')
    end

    within :css, '.intro-text' do
      expect(page).to have_css('h2.heading', text: "¡Encuentre el articulo que necesite!")
      expect(page).to have_css('#search-form')
      expect(page).to have_css('.form-group', count: 2)
      expect(page).to have_css('.btn.btn-primary')
    end

    within :css, '#articles' do
      expect(page).to have_selector('h2.title', text: 'Articulos destacados')
      expect(page).to have_css('.star-primary')
      expect(page).to have_css('.hero-feature', count: 4)
      expect(page).to have_css('a.btn-outline', text: 'Ver mas')
    end
  end
end

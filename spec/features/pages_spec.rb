require 'rails_helper'

RSpec.feature "Pages", type: :feature do
  scenario 'home page' do
    visit root_path
    expect(page).to have_title "Llevatelo"

    within :css, '.navbar' do
      expect(page).to have_css('a.navbar-brand', text: 'Llevatelo.co')
      expect(page).to have_css('.navbar-right')
      expect(page).to have_css('.navbar-right li', count: 3)
      expect(page).to have_css('.navbar-right', text: 'Registrarse')
      expect(page).to have_css('.navbar-right', text: 'Ingresar')
      expect(page).to have_css('.sign-in a', text: 'Publicar')
    end

    within :css, '.intro-text' do
      expect(page).to have_css('h2.heading')
    end

    within :css, '#articles' do
      expect(page).to have_selector('h2.title', text: 'Articulos')
      expect(page).to have_css('.star-primary')
    end
  end

  scenario 'should return login page' do
    visit root_path
    find('.sign-in a').click
    expect(current_path).to eq new_user_session_path
  end

  scenario 'should return registration new page' do
    visit root_path
    find('a', text: 'Registrarse').click
    expect(current_path).to eq new_user_registration_path
  end
end

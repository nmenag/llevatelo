require 'rails_helper'

RSpec.feature "Pages", type: :feature do
  scenario 'home page' do
    visit root_path
    expect(page).to have_title "Llevatelo"

    within :css, '.navbar' do
      expect(page).to have_css('a.navbar-brand', text: 'llevatelo')
      expect(page).to have_css('.navbar-right')
      expect(page).to have_css('.navbar-right li', count: 4)
    end

    within :css, '#articles' do
      expect(page).to have_selector('h2', text: 'Últimos Artículos')
    end
  end

  scenario 'should return login page' do
    visit root_path
    find('.btn-sign-in').click
    expect(current_path).to eq new_user_session_path
  end

  scenario 'when click in new article should return login page' do
    visit root_path
    find('.btn-started').click
    expect(current_path).to eq new_user_session_path
  end
end

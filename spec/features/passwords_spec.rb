require 'rails_helper'

RSpec.feature "Passwords", type: :feature do
  scenario 'reset password form' do
    visit new_user_password_path

    within :css, '.login-form' do
      expect(page).to have_css('.panel-login')
      expect(page).to have_css('.panel-heading')
      expect(page).to have_css('.panel-heading h4', text: "¿Olvidaste tu contraseña?")
      expect(page).to have_css('.new_user')
      expect(page).to have_css('.form-group', count: 2)
      expect(page).to have_css('.btn-login')
    end

    expect(page).to have_css('.panel-body a', text: 'Iniciar Sesión')
    expect(page).to have_css('.panel-body a', text: 'Registrarse')
  end

  scenario 'should display register form' do
    visit new_user_password_path
    all('.panel-body a').first.click
    expect(current_path).to eq new_user_session_path
  end

  scenario 'should display reset password form' do
    visit new_user_password_path
    all('.panel-body a').last.click
    expect(current_path).to eq new_user_registration_path
  end
end

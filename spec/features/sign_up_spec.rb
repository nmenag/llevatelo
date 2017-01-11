require 'rails_helper'

RSpec.feature "SignUp", type: :feature do
  scenario 'sign up page' do
    visit new_user_registration_path

    within :css, '.login-form' do
      expect(page).to have_css('.panel-login')
      expect(page).to have_css('.panel-heading')
      expect(page).to have_css('.panel-heading h4', text: "Registro")
      expect(page).to have_css('.new_user')
      expect(page).to have_css('.form-group', count: 4)
      expect(page).to have_css('.btn-register')
    end

    expect(page).to have_css('.panel-body a', text: 'Iniciar Sesión')
    expect(page).to have_css('.panel-body a', text: 'Olvidaste la contraseña')
  end

  scenario 'should display sign in form' do
    visit new_user_registration_path
    all('.panel-body a').first.click
    expect(current_path).to eq new_user_session_path
  end

  scenario 'should display reset password form' do
    visit new_user_registration_path
    all('.panel-body a').last.click
    expect(current_path).to eq new_user_password_path
  end
end

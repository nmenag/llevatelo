require 'rails_helper'

RSpec.feature "SignIn", type: :feature do
  scenario 'sign in page ' do
    visit new_user_session_path

    within :css, '.login-form' do
      expect(page).to have_css('.panel-login')
      expect(page).to have_css('.panel-heading')
      expect(page).to have_css('.panel-heading h4', text: "Ingresar")
      expect(page).to have_css('.new_user')
      expect(page).to have_css('.form-group', count: 3)
      expect(page).to have_css('.btn-login')
    end

    expect(page).to have_css('.panel-body a', text: 'Registrarse')
    expect(page).to have_css('.panel-body a', text: 'Olvidaste la contraseña')
  end

  scenario 'should display register form' do
    visit new_user_session_path
    all('.panel-body a').first.click
    expect(current_path).to eq new_user_registration_path
  end

  scenario 'should display reset password form' do
    visit new_user_session_path
    all('.panel-body a').last.click
    expect(current_path).to eq new_user_password_path
  end
end

require 'rails_helper'

RSpec.feature "SignUp", type: :feature do
  scenario 'sign up page' do
    visit new_user_registration_path

    within :css, '.login-form' do
      expect(page).to have_css('.panel-login')
      expect(page).to have_css('.panel-heading')
      expect(page).to have_css('.panel-heading h4', text: "Registro")
      expect(page).to have_css('.new_user')
      expect(page).to have_css('.form-group', count: 5)
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


  context 'register user', js: true do
    scenario 'when all the input is empty' do
      form_register
      save_and_open_page
      expect(page).to have_selector '#user_email-error'
      expect(page).to have_selector '#user_phone-error'
      expect(page).to have_selector '#user_password-error'
      expect(page).to have_selector '#user_password_confirmation-error'
    end
  end
end

def form_register(opts={})
  visit new_user_registration_path
  fill_in 'user_email', with: opts[:email]
  fill_in 'user_phone', with: opts[:phone]
  fill_in 'user_password', with: opts[:password]
  fill_in 'user_password_confirmation', with: opts[:password_confirmation]
  click_button "Registrarse"
end

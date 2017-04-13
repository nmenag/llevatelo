require 'rails_helper'

RSpec.feature "SignUp", type: :feature do
  scenario 'sign up page' do
    visit new_user_registration_path

    within :css, '.login-form' do
      expect(page).to have_css('.panel-login')
      expect(page).to have_css('.panel-heading')
      expect(page).to have_css('.panel-heading h3', text: "Registro")
      expect(page).to have_css('.new_user')
      expect(page).to have_css('.form-group', count: 5)
      expect(page).to have_css('.btn-info')
    end

    expect(page).to have_css('.panel-body a', text: 'Iniciar Sesión')
    expect(page).to have_css('.panel-body a', text: 'Olvidaste la contraseña')
  end

  scenario 'should display sign in form' do
    visit new_user_registration_path
    all('.panel-body a')[0].click
    expect(current_path).to eq new_user_session_path
  end

  scenario 'should display reset password form' do
    visit new_user_registration_path
    all('.panel-body a')[1].click
    expect(current_path).to eq new_user_password_path
  end

  context 'register user', js: true do
    scenario 'with valid input' do
      user = build(:user)
      password = Faker::Internet.password

      expect{
        form_register(
          email: user.email,
          phone: user.phone,
          password:password,
          password_confirmation: password
        )
      }.to change(User, :count).by 1

      last_user = User.last
      expect(last_user.email).to eq user.email
      expect(last_user.phone).to eq user.phone
      expect(current_path).to eq root_path
    end

    scenario 'when the user exist' do
      user = create(:user)
      password = Faker::Internet.password

      form_register(
        email: user.email,
        phone: user.phone,
        password:password,
        password_confirmation: password
      )
      expect(page).to have_css('.alert-danger', text: 'Correo electronico ya está en uso')
    end

    scenario 'when password and password confirmation is empty' do
      form_register
      expect(page).to have_css('#user_password-error')
      expect(page).to have_css('#user_password_confirmation-error')
    end

    scenario 'when the email and the phone is empty' do
      password = Faker::Internet.password

      form_register(
        password:password,
        password_confirmation: password
      )

      expect(page).to have_css('.alert-danger', text: 'El Correo electrónico o Teléfono no puede estar en blanco')
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

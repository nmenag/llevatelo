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

  context 'login' do
    let!(:user){ create(:user) }

    scenario 'with credentials invalid' do
      password = Faker::Internet.password
      sign_in_form(
        email: user.email,
        password: password
      )

      within :css, '#flash_alert' do
        expect(page).to have_content 'Email o contraseña inválidos.'
      end
    end

    scenario 'with credentials invalid' do
      password = Faker::Internet.password
      sign_in_form(
        email: user.email,
        password: password
      )

      within :css, '#flash_alert' do
        expect(page).to have_content 'Email o contraseña inválidos.'
      end
    end

    scenario 'access user registered' do
      login(user)

      expect(current_path).to eq root_path

      within :css, '.dropdown' do
        expect(page).to have_content user.email.split('@')[0]
      end

      within :css, '.dropdown-menu' do
        expect(page).to have_content 'Mis Publicaciones'
        expect(page).to have_content 'Editar'
        expect(page).to have_content 'Perfil'
        expect(page).to have_content 'Salir'
      end
    end

    scenario 'sign out' do
      login(user)
      click_link 'Salir'
      expect(page).to have_selector '.sign-in'

      within :css, '.sign-in' do
        expect(page).to have_content 'Login'
      end
    end
  end
end

def sign_in_form(opts={})
  visit new_user_session_path
  fill_in 'user_email', with: opts[:email]
  fill_in 'user_password', with: opts[:password]
  click_button "Ingresar"
end

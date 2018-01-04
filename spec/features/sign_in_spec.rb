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
      expect(page).to have_css('.btn-info')
    end

    expect(page).to have_css('.panel-body a', text: 'Registrarse')
    expect(page).to have_css('.panel-body a', text: 'Olvidaste la contraseña')
  end

  scenario 'should display register form' do
    visit new_user_session_path
    all('.panel-body a')[0].click
    expect(current_path).to eq new_user_registration_path
  end

  scenario 'should display reset password form' do
    visit new_user_session_path
    all('.panel-body a')[1].click
    expect(current_path).to eq new_user_password_path
  end

  context 'sign in' do
    let!(:user){ create(:user) }

    scenario 'with credentials invalid' do
      password = Faker::Internet.password
      sign_in_form(
        login: user.email,
        password: password
      )

      within :css, '.alert-warning' do
        expect(page).to have_content 'los datos de acceso son inválidos.'
      end
    end

    scenario 'access user registered' do
      login(user)

      expect(current_path).to eq root_path

      within :css, '.dropdown' do
        expect(page).to have_content 'Mi Perfil'
      end

      within :css, '.dropdown-menu' do
        expect(page).to have_content 'Mis Publicaciones'
        expect(page).to have_content 'Editar'
        expect(page).to have_content 'Perfil'
        expect(page).to have_content 'Salir'
      end
    end
  end

  context 'sign out' do
    let!(:user){ create(:user) }

    scenario 'should destroy session' do
      login(user)
      click_link 'Salir'
      expect(page).to have_selector '.sign-in'
    end
  end
end

def sign_in_form(opts={})
  visit new_user_session_path
  fill_in 'user_login', with: opts[:login]
  fill_in 'user_password', with: opts[:password]
  click_button "Ingresar"
end

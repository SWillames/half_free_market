require 'rails_helper'

feature 'User sign in' do
  scenario 'from home page' do
    visit root_path

    expect(page).to have_link('Entrar')
  end

  scenario 'successfully' do
    User.create!(email: 'johndoe@example.com', password: '123456')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'johndoe@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'

    expect(page).to have_content('Logado com sucesso.')
    expect(page).to have_link('Sair')
  end

  scenario 'and sign out' do
    User.create!(email: 'johndoe@example.com', password: '123456')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'johndoe@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Sair'

    expect(page).not_to have_content('Login efetuado com sucesso.')
    expect(page).to have_link('Entrar')
    expect(page).not_to have_link('Sair')
  end
end
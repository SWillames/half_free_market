require 'rails_helper'

feature 'User sign up' do
  scenario 'from home page' do
    visit root_path
    expect(page).to have_link('Cadastrar')
    expect(page).to have_link('Entrar') 
  end

  scenario 'successfully' do
    company = create(:company)
    visit root_path
    click_on 'Cadastrar'
    
    fill_in 'Email', with: 'sergio@example.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'

    click_on 'Sign up'
    expect(page).to have_content('Bem-vindo! Você se registrou com êxito')
    expect(page).to have_link('Sair') 
  end
  scenario 'unsuccessufuly' do
    visit root_path
    click_on 'Cadastrar'
  
    click_on 'Sign up'

    
    expect(page).to have_content('2 erros impediram que user fosse salvo(a):')
    expect(page).to have_content('Email não pode ficar em branco')
    expect(page).to have_content('Password não pode ficar em branco')
  end
  scenario 'and password different password confirmation' do
    visit root_path
    click_on 'Cadastrar'
    fill_in 'Email', with: 'johndoe@example.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '990003'
    click_on 'Sign up'

    expect(page).to have_content('Password confirmation não é igual a Password')
  end

  scenario 'and password too short' do
    visit root_path
    click_on 'Cadastrar'
    fill_in 'Email', with: 'joaquim@rotes.com'
    fill_in 'Password', with: '12345'
    fill_in 'Password confirmation', with: '12345'
    click_on 'Sign up'

    expect(User.count).to eq 0
    expect(page).to have_content('Password é muito curto (mínimo: 6 caracteres)')
  end

  

end
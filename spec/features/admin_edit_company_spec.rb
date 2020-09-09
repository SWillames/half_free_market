require 'rails_helper'

feature 'Admin edits company' do
  scenario 'successufully' do
    company = create(:company)
    visit root_path
    click_on 'Empresas'
    click_on  company.name
    click_on 'Editar'
    
    expect(page).to  have_current_path(/companies\/[0-9]+/)
    fill_in 'Nome', with: 'Tilojoaria'
    fill_in 'Razão Social', with: 'Tijoloaria São Bento S/A'
    fill_in 'CNPJ', with: company.cnpj
    fill_in 'Endereço', with: 'Av. David Caldas 345'
    fill_in 'Dominio', with: company.domain
    fill_in 'Redes sociais', with: company.social_networks
    click_on 'Enviar'

    expect(page).to have_content("Tilojoaria")
    expect(page).not_to have_content(company.name)
    expect(page).to have_content('Tijoloaria São Bento S/A')
    expect(page).not_to have_content(company.corporate_name)
    expect(page).to have_content(company.cnpj)
    expect(page).to have_content('Av. David Caldas 345')
    expect(page).not_to have_content(company.address)
    expect(page).to have_content(company.domain)
    expect(page).to have_content(company.social_networks)
  end

  scenario 'attributes cannot be blank' do
    company = create(:company)
    visit root_path
    click_on 'Empresas'
    click_on  company.name
    click_on 'Editar'
    fill_in 'Nome', with: ''
    fill_in 'Razão Social', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'Endereço', with: ''
    fill_in 'Dominio', with: ''
    fill_in 'Redes sociais', with: ''
    click_on 'Enviar'
    
    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Razão Social não pode ficar em branco')
    expect(page).to have_content('CNPJ não pode ficar em branco')
    expect(page).to have_content('Endereço não pode ficar em branco')
    expect(page).to have_content('Dominio não pode ficar em branco')
    
  end
end

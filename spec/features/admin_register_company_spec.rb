require 'rails_helper'

feature 'Admin register company' do
  scenario 'successufuly' do
    visit root_path

    click_on 'Empresas'
    
    fill_in 'Nome', with: "Hirthe-Ritchie"
    fill_in 'Razão Social', with: "Hirthe-Ritchie S/A"
    fill_in 'CNPJ', with: "18.553.414/0006-18"
    fill_in 'Endereço', with: "Av. Bucar Neto, 127"
    fill_in 'Dominio', with: "@hir-rit.com"
    fill_in 'Redes Sociais', with: "@hir-rit"

    click_on 'Enviar'

    expect(current_path).to eq company_path(Company.last)
    expect(page).to have_content t('notice.register.title')
    expect(page).to have_content t('activerecord.attributes.company.name')+':'
    expect(page).to have_content (Company.last.name)
    expect(page).to have_content t('activerecord.attributes.company.corporate_name')+':'
    expect(page).to have_content (Company.last.corporate_name)
    expect(page).to have_content t('activerecord.attributes.company.cnpj')+':'
    expect(page).to have_content (Company.last.cnpj)
    expect(page).to have_content t('activerecord.attributes.company.domain')+':'
    expect(page).to have_content (Company.last.domain)
    expect(page).to have_content t('activerecord.attributes.company.address')+':'
    expect(page).to have_content (Company.last.address)
    expect(page).to have_content t('activerecord.attributes.company.social_networks')+':'
    expect(page).to have_content (Company.last.social_networks)
  end  
end
require 'rails_helper'

feature 'Admin register company' do
  scenario 'successufuly' do
    visit root_path

    click_on 'Empresas'
    click_on 'Novo'
    fill_in 'Nome', with: "Hirthe-Ritchie"
    fill_in 'Razão Social', with: "Hirthe-Ritchie S/A"
    fill_in 'CNPJ', with: "18.553.414/0006-18"
    fill_in 'Endereço', with: "Av. Bucar Neto, 127"
    fill_in 'Dominio', with: "@hir-rit.com"
    fill_in 'Redes sociais', with: "@hir-rit"

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

  scenario 'cnpj must be unique' do
    company = create(:company)
    company1 = create(:company)

    visit root_path
    click_on 'Empresas'
    click_on 'Novo'

    fill_in 'Nome', with: company1.name
    fill_in 'Razão Social', with: company1.corporate_name
    fill_in 'CNPJ', with: company.cnpj
    fill_in 'Dominio', with: company1.domain
    fill_in 'Endereço', with: company1.address
    fill_in 'Redes sociais', with: company1.social_networks
    puts company.cnpj
    click_on 'Enviar'
    expect(page).to have_content('CNPJ já está em uso')
    
    
  end

end
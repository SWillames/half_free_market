require 'rails_helper'

feature 'Admin view companies' do
  scenario 'successufully' do
    company = create(:company)
    company1 = create(:company)
    company2 = create(:company)

    visit root_path
    click_on "Empresas"

    expect(current_path).to eq companies_path
    expect(page).to have_content(company.name)
    expect(page).to have_content(company1.name)
    expect(page).to have_content(company2.name)
  end

  scenario 'and view details' do
    company = create(:company)
    company1 = create(:company)
    company2 = create(:company)

    visit root_path
    click_on 'Empresas'
    click_on company.name

    expect(page).to have_content(company.name)
    expect(page).to have_content(company.corporate_name)
    expect(page).to have_content(company.cnpj)
    expect(page).to have_content(company.address)
    expect(page).to have_content(company.domain)
    expect(page).to have_content(company.social_networks)
    expect(page).not_to have_content(company1.name)
  end

  scenario 'no companies are created' do
    visit root_path
    click_on 'Empresas'    

    expect(page).to have_content('Nenhuma Empresa cadastrada')
    expect(page).to have_content('Nome Razão Social CNPJ Endereço Dominio Redes sociais')
  end

  scenario 'return to home page' do
    visit root_path
    click_on 'Empresas'

    click_on 'Voltar'
    expect(current_path).to eq root_path
  end
end
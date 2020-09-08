require 'rails_helper'

feature 'Admin edits company' do
  scenario 'successufully' do
    company = create(:company)
    visit root_path
    click_on 'Empresas'
    click_on 'Editar'
    fill_in 'Nome', with: 'Tilojoaria'
    fill_in 'Razão social', with: 'Tijoloaria São Bento S/A'
    fill_in  'CNPJ', whit: company.cnpj
    fill_in 'Endereço', whith: company.address
    fill_in 'Dominio', with: company.domain
    fill_in 'Redes Sociais', whith: company.socialy_networks
    click_on 'Enviar'

    expect(page).to have_content("Tilojoaria")
    expect(page).not_to have_content(company.name)
    expect(page).to have_content('Tijoloaria São Bento S/A')
    expect(page).not_to have_content(company.corporate_name)
    expect(page).to have_content(company.cnpj)
    expect(page).to have_content(company.domain)
    expect(page).to have_content(company.social_netwoks)
  end  
end

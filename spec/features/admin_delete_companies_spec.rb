require 'rails_helper'

feature 'Admin deletes company' do
  scenario 'does something' do
    company = create(:company)
    visit root_path 
    click_on 'Empresas'
    click_on company.name
    click_on 'Apagar'

    expect(current_path).to eq companies_path
    expect(page).to have_content('Nenhuma Empresa cadastrada')
  end

  scenario 'and keep anothers' do
    company = create(:company)
    company1 = create(:company)

    visit root_path 
    click_on 'Empresas'
    click_on company.name
    click_on 'Apagar'
    expect(current_path).to eq companies_path
    expect(page).not_to have_content(company.name)
    expect(page).to have_content(company1.name)

  end
end
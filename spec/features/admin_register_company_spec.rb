require 'rails_helper'

feature 'Admin register company' do
  scenario 'successufuly' do
    visit root_path

    click_on t('home.link.register.company')
    expect(page).to have_content t('actions.new')
    expect(page).to have_content t('activerecord.models.company.one')
    fill_in t('activerecord.attributes.company.name'), with: "Hirthe-Ritchie"
    fill_in t('activerecord.attributes.company.corporate_name'), with: "Hirthe-Ritchie S/A"
    fill_in t('activerecord.attributes.company.cnpj'), with: "18553414000618"
    fill_in t('activerecord.attributes.company.domain'), with: "@hir-rit.com"
    fill_in t('activerecord.attributes.company.address'), with: "Av. Bucar Neto, 127"
    fill_in t('activerecord.attributes.company.social_networks'), with: "@hir-rit"

    click_on t('helpers.submit.create')

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
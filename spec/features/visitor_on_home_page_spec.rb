require 'rails_helper'

feature 'Visitor on home page' do
  scenario 'successufully' do
    visit root_path

    expect(page).to have_content('Seja Bemvindo')
  end
  
end
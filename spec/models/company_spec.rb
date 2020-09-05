require 'rails_helper'

RSpec.describe Company, type: :model do
  context 'validations' do
    let(:company) {create(:company)}
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:corporate_name) }
    it { is_expected.to validate_presence_of(:cnpj) }
    it { is_expected.to validate_presence_of(:domain) }
    it { is_expected.to validate_presence_of(:address) }
    it 'expected validate uniqueness of cnpj' do
      company1 = build(:company, cnpj: company.cnpj)
      expect validate_uniqueness_of(:cnpj).ignoring_case_sensitivity
      expect(company1).not_to be_valid
      expect(company1.errors[:cnpj]).to be_present
    end
    it 'expected validate uniqueness of domain' do
      company1 = build(:company, domain: company.domain)
      expect validate_uniqueness_of(:domain).ignoring_case_sensitivity
      expect(company1).not_to be_valid
      expect(company1.errors[:domain]).to be_present
    end

    %w[
      17.892.638/0004-2
      27170.447/0004-08
      8a.728.323/0004-88
      3G.044.291/0008-10
      0#$.271.049/0002-71
      96.@70.884/001-73
      37.321-767/0006-
      63.768.6740004-01
      68.472559/@007-43
      9.522.536/0003-33
      21.869.001/0006*51
    ].each do |cnpj|
      it 'require #{cnpj} as valid cnpj' do  
        company1 = build(:company, cnpj: cnpj)
        expect(company1).not_to be_valid
        expect(company1.errors[:cnpj]).to be_present
        
      end
    end

    
    %w[
      017.892.638/0004-2
      1.7170.447/0004-08
      8a.728.323/0004-88
      3G.044.291/0008-10
      906.@70.884/001-73
      0037.321-767/0006-
      63U.768.6740004-01
      68.472559/@007-430
      9.522.536/00031-33
    ].each do |cnpj|
      it 'require #{cnpj} as valid cnpj' do  
        company1 = Company.create(cnpj: cnpj)
        
        expect(company1.errors[:cnpj]).to include t('activerecord.error.personalized.format')
      end
    end
  end
end

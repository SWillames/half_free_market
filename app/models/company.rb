class Company < ApplicationRecord
  validates_presence_of :name, :corporate_name, :cnpj, :address, :domain
  validates_uniqueness_of :cnpj, :domain

  validates :cnpj, format: { with: /[0-9]{2}\.?[0-9]{3}\.?[0-9]{3}\/?[0-9]{4}\-?[0-9]{2}/, message: I18n.t('activerecord.error.personalized.format')}
  validates :cnpj, length: { is: 18 }
end

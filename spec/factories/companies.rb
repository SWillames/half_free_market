FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    corporate_name { name+" - "+Faker::Company.suffix }
    cnpj { Faker::Company.brazilian_company_number(formatted: true) }
    address { Faker::Address.full_address }
    domain { Faker::Internet.domain_name }
    social_networks { "@"+name.split[0].downcase+"-"+name.split.last.downcase }
  end
end
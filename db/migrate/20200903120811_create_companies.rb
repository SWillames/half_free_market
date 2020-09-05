class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :corporate_name
      t.string :cnpj
      t.string :address
      t.string :domain
      t.string :social_networks

      t.timestamps
    end
  end
end

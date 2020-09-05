class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def show
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.new(company_params)
    if @company.save
        redirect_to @company , notice: I18n.t('notice.register.title')
    else
        render :new
    end
  end

  private

  def company_params
    params.require(:company)
          .permit(:name, :corporate_name, :cnpj, 
                  :address, :domain, :social_networks)    
  end
end
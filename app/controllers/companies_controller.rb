class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end
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

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to @company
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_path
  end

  private

  def company_params
    params.require(:company)
          .permit(:name, :corporate_name, :cnpj, 
                  :address, :domain, :social_networks)    
  end
end
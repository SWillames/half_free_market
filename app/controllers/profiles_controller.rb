class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create]

  def new
    @profile = Profile.new
  end

  def create
      @user = User.find(current_user.id)
      @profile = @user.build_profile(profile_params) 
      @profile.save
      redirect_to @profile, notice: 'Perfil salvo com sucesso!'
  end
  
  private 

    def profile_params
        company = Company.find_by(domain: current_user.add_co)
        params.require(:profile)
              .permit(:full_name,:birth_of_date,:employment,:department,:cpf)
              .merge(company: company)
    end

end
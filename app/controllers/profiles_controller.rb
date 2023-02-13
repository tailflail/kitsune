class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_and_authorize_profile

  def update
    if @profile.update(profile_params)
      redirect_to current_user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:short_biography, :long_biography)
  end

  def find_and_authorize_profile
    @profile = current_user.profile
    authorize @profile
  end
end

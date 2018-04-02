class CredentialsController < ApplicationController
  before_action :set_credentials
  before_action :set_credential, only: [:edit, :update, :destroy]

  # GET users/1/credentials/new
  def new
    if (@user.credential.nil?)
      @credential = @user.build_credential
    else
      @credential = @user.credential
    end
  end

  # POST users/1/credentials
  def create
    @credential = @user.build_credential(credential_params)

    if @credential.save
      redirect_to(authenticated_root_path, notice: 'Credential was successfully created.')
    else
      render action: 'new'
    end
  end

  # DELETE users/1/credentials/1
  def destroy
    @credential.destroy

    redirect_to authenticated_root_path(@user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credentials
      @user = User.find(current_user.id)
    end

    def set_credential
      @credential = @user.credential
    end

    # Only allow a trusted parameter "white list" through.
    def credential_params
      params.require(:credential).permit(:username, :password, :user_id)
    end
end

class UsersController < ApplicationController

  def create
    @user =  User.new(user_params)

    if @user.save
      render json: @user
    else
      render(json: @user.errors.full_messages, status: :unprocessable_entity)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete

    render text: "user destroyed"
  end

  def index
    @users = User.all

    render json: @users
  end

  def show
    @user = User.find(params[:id])

    render json: @user
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render json: @user
    else
      render(json: @user.errors.full_messages, status: :unprocessable_entity)
    end
  end

  def favorites
    @user = User.find(params[:id])
    @favorite_contact_shares = @user.contact_shares.where(favorite: true)
    # @favorite_contacts = Contact.select(*).join("JOIN contact_shares ON contact.id = contact_share.contact_id").where("contact.user_id = #{@user.id} AND contact_shares.favorite = true")

    render json: {contacts: @user.contacts.where(favorite: true), contact_shares: @favorite_contacts}
  end

  private

    def user_params
      params.require(:user).permit(:username)
    end
end

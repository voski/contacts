class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.delete

    render text: "contact destroyed"
  end

  def index
    @user = User.find(params[:user_id])

    render(json: {contacts: @user.contacts, shared_contacts: @user.shared_contacts})
  end

  def show
    @contact = Contact.find(params[:id])

    render json: @contact
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

    def contact_params
      params[:contact].permit(:user_id, :email, :name)
    end
end

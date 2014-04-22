class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Your contact was created!"
      redirect_to contacts_path
    else
      render 'new'
    end
  end

  def show
    @contact = Contact.find(params[:id])
    @messages = Message.where(:to => @contact.phone, user_id: current_user.id)
  end

private

  def contact_params
    params.require(:contact).permit(:name, :phone, :user_id)
  end
end

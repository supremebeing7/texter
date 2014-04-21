class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
    @contact = Contact.find_by_phone(params[:phone]) if params[:phone]
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.js { redirect_to messages_path, notice: "Your messages was sent!" }
        format.html
      end
    else
      render 'new'
    end
  end

  def show
    @message = Message.find(params[:id])
  end

private

  def message_params
    params.require(:message).permit(:to, :from, :body)
  end
end

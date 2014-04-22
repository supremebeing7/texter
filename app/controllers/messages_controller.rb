class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
    if params[:phone]
      @contact = Contact.find_by_phone(params[:phone])
    else
      @contact = Contact.new
    end
  end

  def create
    @message = Message.new(message_params)
    @contact = Contact.find_by_phone(params[:message][:to])
    if @message.save
      respond_to do |format|
        format.html { redirect_to messages_path, notice: "Your messages was sent!" }
        format.js
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
    params.require(:message).permit(:to, :from, :body, :user_id)
  end
end

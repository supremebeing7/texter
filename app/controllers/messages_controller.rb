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
    @contact = Contact.find_by_phone(params[:message][:to])
    @messages = []
    params[:to].each do |phone|
      @message = Message.new(message_params)
      @message.to = phone
      @messages << @message
    end
    @messages.each { |message| message.save }
    respond_to do |format|
      format.html { redirect_to messages_path, notice: "Message was sent!" }
      format.js
    end

# if @messages.length > 1
#       @messages.each { |message| message.save }
#       respond_to do |format|
#         format.js
#       end
#       redirect_to messages_path, notice: "Messages sent!"
#     else
#       @message.save
#       respond_to do |format|
#         format.html { redirect_to messages_path, notice: "Message was sent!" }
#         format.js
#       end
#     end

  end

  def show
    @message = Message.find(params[:id])
  end

private

  def message_params
    params.require(:message).permit(:to, :from, :body, :user_id)
  end


end

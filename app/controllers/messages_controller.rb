class MessagesController < ApplicationController
  def new
    render "new", locals: { message: Message.new }
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      ContactMailer.contact(@message).deliver
      redirect_to root_url, notice: "Correo enviado. Gracias por contactarnos."
    else
      render "new"
    end
  end
end

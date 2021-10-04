class Api::MessagesController < Api::BaseController
  before_action :set_message, only: %w[show update destroy]

  def index
    @messages = Message.all

    render json: @messages
  end

  def show
    render_jsonapi_response(@message)
  end

  def create
    @message = current_user.messages.new(message_params)

    @message.save
    render_jsonapi_response(@message)
  end

  def update
    @message.update(message_params)
    render_jsonapi_response(@message)
  end

  def destroy
    @message.destroy
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:body, :group_id, :user_id)
  end
end

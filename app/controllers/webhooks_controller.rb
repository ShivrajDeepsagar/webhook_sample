class WebhooksController < ApplicationController

  POSTMAN_ECHO_URL = 'https://postman-echo.com/post'

  def index
    @webhooks = Webhook.all
  end

  def create
    @webhook = Webhook.new(webhook_params)
byebug
    if @webhook.save
      send_post_request_to_postman_echo(@webhook.url, @webhook.payload)
      render json: { message: 'Webhook created successfully and sent to Postman Echo' }, status: :created
    else
      render json: { errors: @webhook.errors.full_messages }, status: :unprocessable_entity
    end
  end

  #private

  def webhook_params
    byebug
    params.require(:webhook).permit(:url, :payload)
  end

  def send_post_request_to_postman_echo(url, payload)
    byebug
    response = RestClient.post(POSTMAN_ECHO_URL, payload.to_json, content_type: :json)
    puts "Postman Echo Response Code: #{response.code}"
    puts "Postman Echo Response Body: #{response.body}"
  rescue RestClient::ExceptionWithResponse => e
    puts "Error: #{e.response.code} - #{e.response.body}"
  end

end

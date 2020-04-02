class ChatBotController < ApplicationController

  def webhook
    request.body.rewind
    result = JSON.parse(request.body.read)["queryResult"]

    if result["contexts"].present?
      response = InterpretService.call(result["action"], result["contexts"][0]["parameters"])
    else
      response = InterpretService.call(result["action"], result["parameters"])
    end

    content_type :json, charset: 'utf-8' 
    {
      "fulfillmentText": response,
      "payload": {
        "telegram": {
          "text": response,
          "parse_mode": "Markdown"
        }
      }
    }.to_json
  end
end

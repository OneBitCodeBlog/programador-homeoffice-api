class ChatbotController < ApplicationController

  def webhook
    
    request.body.rewind
    result = JSON.parse(request.body.read)
    action = result["queryResult"]["action"]
    
    response = InterpretService.call(action: action, result: result)
    
    render :json => response
    
  end
end

class InterpretService

  def self.call(action:, result:)
    case action
    when "search"
      keyword = result["queryResult"]["parameters"]["keyword"]
      SearchJobService.new(keyword: keyword).call()
    when "alert"
      session = result["session"].split('/')[-1]
      language = result["queryResult"]["parameters"]["linguagem"]
      CreateAlertService.new(session: session, language: language).call
    when "list"
      session = result["session"].split('/')[-1]
      ListAlertService.new(session: session).call
    when "delete"
      session = result["session"].split('/')[-1]
      tag = result["queryResult"]["parameters"]["IDAlarm"]
      DeleteAlertService.new(session: session, tag: tag).call
    when "input.welcome"
      session = result["session"].split('/')[-1]
      name = result["queryResult"]["parameters"]["name"]
      CreateUserService.new(session: session, name: name).call()
    else
      "Desculpe, mas não te entendi. Tente novamente"
    end
  end
  
end
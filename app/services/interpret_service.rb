class InterpretService

  def self.call(action, params)
    case action
    when "search"
      SearchJobService.new(params).call()
    else
      "Desculpe, mas não te entendi. Tente novamente"
    end
  end
  
end
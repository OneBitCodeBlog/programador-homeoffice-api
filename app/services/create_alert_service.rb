class CreateAlertService

  def initialize(session:, language:)
    @session = session
    @language = language
  end

  def call
    key_word = KeyWord.find_by(tag: @language)
    if key_word.nil?
      KeyWord.create!(
        tag: @language
      )
      key_word = KeyWord.last    
    end
    Search.create!(
      user: User.find_by(session_id: @session),
      alarm_rate: 1,
      key_word: key_word
    )
    response = {
      "fulfillmentText": "Vagas - Remoto",
      "fulfillmentMessages": {
        "text": {
          "text": [
            "Seu alarme foi criado com sucesso. Assim que uma nova vaga para #{@language} surgir você receberá um alerta"
          ]
        }
      }
    }
  end
end
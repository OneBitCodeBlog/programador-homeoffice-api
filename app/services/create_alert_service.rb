class CreateAlertService

  def initialize(session:, language:)
    @session = session
    @language = language
  end

  def call
    Search.create!(
      user: User.find_by(session_id: @session),
      alarm_rate: 1,
      key_word: KeyWord.find_by(tag: @language)
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
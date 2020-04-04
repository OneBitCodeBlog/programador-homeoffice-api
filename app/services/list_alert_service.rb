class ListAlertService

  def initialize(session:)
    @session = session
  end

  def call
    alerts = Search.where(user: User.find_by(session_id: @session))
    hashes = []
    if alerts.blank?
      hashes << {
        "card": {
          "title": "Você não tem nenhum alerta cadastrado"
        }
      }
    else
      alerts.each do |alert|
        hashes << {
          "card": {
            "title": "Seus alertas",
            "subtitle": "Você tem um alerta para a palavra-chave: #{alert.key_word.tag}",
          }
        }
      end
    end
    response = {
      "fulfillmentText": "Vagas - Remoto",
      "fulfillmentMessages": hashes
    }
  end
end
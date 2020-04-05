class DeleteAlertService

  def initialize(session:, tag:)
    @session = session
    if tag == 'todos'
      @tag = nil
    else
      @tag = tag
    end
  end

  def call
    hashes = []
    if @tag.nil?
      alerts = Search.where(user: User.find_by(session_id: @session))
      alerts.each do |alert|
        alert.destroy
        hashes << {
          "card": {
            "title": "Todos seus alertas foram excluídos com sucesso"
          }
        }
      end
    else
      key_word = KeyWord.find_by(tag: @tag)
      alerts = Search.find_by(
        user: User.find_by(session_id: @session),
        key_word: key_word
      )
      alerts.destroy
      hashes << {
        "card": {
          "title": "Seu alerta da palavra chave #{@alert} foi excluído com sucesso"
        }
      }
    end

    response = {
      "fulfillmentText": "Vagas - Remoto",
      "fulfillmentMessages": hashes
    }
  end
end
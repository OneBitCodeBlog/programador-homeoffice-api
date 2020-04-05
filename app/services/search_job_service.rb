class SearchJobService

  def initialize(keyword:)
    @keyword = keyword
  end

  def call
    keyword = KeyWord.find_by(tag: @keyword)
    jobs = JobKeyWord.where(key_word: keyword) 
    hashes = []
    jobs.each do |job|
      hashes << {
        "card": {
          "title": job.job.title,
          "subtitle": "#{job.job.description} - Publicado em:  #{job.job.published_date.strftime("%d/%m/%Y")}",
          "buttons": [
            {
              "text": "Ler mais",
              "postback": job.job.job_link
            }
          ]
        }
      }
    end
    response = {
      "fulfillmentText": "Vagas - Remoto",
      "fulfillmentMessages": hashes
    }
  end
end
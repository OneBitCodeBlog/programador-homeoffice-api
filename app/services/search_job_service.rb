class SearchJobService

  def initialize(params)
    @keyword = params["keyword"]
  end

  def call
    keyword = KeyWord.find_by(tag: @keyword)
    jobs = JobKeyWord.where(key_word: keyword)
  end
end
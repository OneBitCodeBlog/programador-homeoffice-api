# frozen_string_literal: true

class SearchRemoteJobsService
  include JobDesconstruction

  def initialize(params)
    @link = params.dig('link')
    @main_link = params.dig('main_link')
    @link_search = params.dig('link_search')
    @card_group_search = params.dig('card_group')
    @title_search = params.dig('title_search')
    @amount_search = params.dig('amount_search')
    @name = params.dig('name')
  end

  def execute
    cards.map { |card| insert_job(card) }
  end

  private

  def cards
    page.css(@card_group_search)
  end

  def page
    Mechanize.new.get(@link)
  end

  def insert_job(card)
    @card = card
    Job.create(
      title: title, job_link: job_link, salary: salary, published_at: @name
    )
  end
end

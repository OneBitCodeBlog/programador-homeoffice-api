# frozen_string_literal: true

module JobDesconstruction
  def title
    @card.search(@title_search).text.strip
  end

  def salary
    @amount = @card.search(@amount_search).text.delete("\n").delete(' ')
    @split_money = @amount.match(MONEY_PREFIX) if has_money?
    @split_money ? @split_money[2].delete('.').to_i : 0
  end

  def has_money?
    @amount&.match?(MONEY_PREFIX)
  end

  def job_link
    job_link = @card.search(@link_search).attr('href')
    job_link = job_link.text if job_link&.text
    job_link.nil? ? '' : @main_link + job_link
  end
end

require "rails_helper"

RSpec.describe "SearchJobs", type: :request do
  let(:key_word) do
    create(:key_word).tap do |key_word|
      create_list(:job_key_word, 3, key_word: key_word)
    end
  end

  let(:key) { create(:key_word) }

  let(:key_word_attributes) { key_word.attributes }
  let(:json_links) { %w[self first prev next last] }
  let(:parsed_response) { JSON.parse(response.body) }
  let(:parsed_json_attributes) do
    parsed_response["data"].first["attributes"].keys
  end
  let(:json_attributes) do
    %w[
      title
      description
      contract
      job-link
      salary
      company-name
      published-date
    ]
  end

  describe "GET #index" do
    subject(:index) { get api_v1_search_jobs_path(key_word.tag) }

    before do
      key_word
      index
    end

    it "responds with 200" do
      expect(response).to have_http_status :ok
    end

    it "responds with json" do
      expect(parsed_json_attributes)
        .to match_array json_attributes
    end

    it "shows links for pagination" do
      expect(parsed_response["links"].keys).to match_array json_links
    end
  end
end

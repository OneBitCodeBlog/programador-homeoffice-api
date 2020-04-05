require "rails_helper"

RSpec.describe "KeyWords", type: :request do
  let(:key_word) do
    create(:key_word).tap do |key_word|
      create(:job_key_word, key_word: key_word)
    end
  end

  shared_examples "request endpoint" do
    it "responds with 200" do
      expect(response).to have_http_status :ok
    end
  end

  describe "GET #index" do
    subject(:index) { get api_v1_key_words_url }

    before do
      key_word
      index
    end

    include_examples "request endpoint"
  end
end

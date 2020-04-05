require "rails_helper"

RSpec.describe "Jobs", type: :request do
  let(:job) do
    create(:job).tap do |job|
      create(:job_key_word, job: job)
    end
  end

  let(:parsed_response) { JSON.parse(response.body) }
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
    subject(:index) { get api_v1_jobs_url }

    before do
      job
      index
    end

    shared_examples "request index" do
      it "responds with 200" do
        expect(response).to have_http_status :ok
      end

      it "responds with json" do
        expect(parsed_response["data"].first["attributes"].keys)
          .to match_array json_attributes
      end
    end

    shared_examples "pagination" do
      it "shows links for pagination" do
        expect(parsed_response["links"].keys).to match_array json_links
      end
    end

    let(:job_attributes) { job.attributes }
    let(:json_links) { %w[self first prev next last] }

    include_examples "request index"
    include_examples "pagination"

    context "with pagination params" do
      subject(:index) do
        get api_v1_jobs_url, params: { page: { number: 1, size: 1 } }
      end

      include_examples "request index"
      include_examples "pagination"
    end
  end

  describe "GET #show" do
    subject(:show) { get api_v1_job_url(job_id) }

    before do
      job
      show
    end

    let(:job_id) { job.id }

    it "responds with 200" do
      expect(response).to have_http_status :ok
    end

    it "responds with json" do
      expect(parsed_response["data"]["attributes"].keys)
        .to match_array json_attributes
    end

    context "without parameter id" do
      let(:job_id) { 1234 }

      it "returns 404" do
        expect(response).to have_http_status :not_found
      end
    end
  end
end

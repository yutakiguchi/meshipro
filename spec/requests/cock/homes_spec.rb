require 'rails_helper'

RSpec.describe "Cock::Homes", type: :request do
  describe "トップページ" do
    it "正常なレスポンスを返す" do
      get root_path
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end
end

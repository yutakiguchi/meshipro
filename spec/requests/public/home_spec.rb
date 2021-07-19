require 'rails_helper'

RSpec.describe "User::Homes", type: :request do
  describe "トップページ" do
    it "正常なレスポンスを返す" do
      get public_root_path
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end
end

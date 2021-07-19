require "rails_helper"

RSpec.describe "ログイン", type: :request do
  let!(:cock) { create(:cock) }

  it "正常なレスポンスを返すこと" do
    get new_cock_session_path
    expect(response).to be_successful
    expect(response).to have_http_status "200"
  end
end
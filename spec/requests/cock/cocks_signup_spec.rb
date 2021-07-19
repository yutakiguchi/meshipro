require 'rails_helper'

RSpec.describe "ユーザー登録", type: :request do
  before do
    get new_cock_registration_path
  end

  it "正常なレスポンスを返す" do
    expect(response).to be_successful
    expect(response).to have_http_status(200)
  end

  it "有効なユーザーで登録" do
    expect{
      post cock_registration_path,params: {cock:{email: "cock@example.com",
                                            password: "password",
                                            password_confirmation: "password"}}
    }.to change(Cock, :count).by(1)
    follow_redirect!
    expect(response).to render_template('restaurants/new')
  end
  
  it "無効なユーザーで登録" do
    expect {
      post cock_registration_path, params: { cock: { 
                                         email: "user@example.com",
                                         password: "password",
                                         password_confirmation: "pass" } }
    }.not_to change(Cock, :count)
  end
end

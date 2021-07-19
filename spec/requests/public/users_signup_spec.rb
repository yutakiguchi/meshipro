require 'rails_helper'

RSpec.describe "ユーザー登録", type: :request do
  before do
    get new_user_registration_path
  end

  it "正常なレスポンスを返す" do
    expect(response).to be_successful
    expect(response).to have_http_status(200)
  end

  it "有効なユーザーで登録" do
    expect{
      post user_registration_path,params: {user:{nickname: "name",
                                                 email: "user@example.com",
                                                 password: "password",
                                                 password_confirmation: "password"}}
    }.to change(User, :count).by(1)
    follow_redirect!
    expect(response).to render_template('public/recipes/index')
  end

  it "無効なユーザーで登録" do
    expect {
      post user_registration_path, params: {user:{nickname: "",
                                                  email: "user@example.com",
                                                  password: "password",
                                                  password_confirmation: "pass" } }
    }.not_to change(User, :count)
  end
end

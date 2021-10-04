# frozen_string_literal: true

require 'rails_helper'

describe Api::UsersController, type: :controller do

  let(:other_user) { create(:user) }

  before { sign_in other_user }

  describe 'GET index' do
    let!(:user) { create :user }

    before { get :index }

    it { expect(response).to have_http_status(:success) }
    it { expect(User.last.email).to eq(user.email) }
  end

  describe 'GET show' do
    before { get :show, params: { id: other_user.id } }

    it { expect(response).to have_http_status(:success) }
    it { expect(json['data']['attributes']['email']).to eq(other_user.email) }
  end

end

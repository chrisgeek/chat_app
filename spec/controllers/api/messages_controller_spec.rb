# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::MessagesController, type: :controller do

  let(:user)   { create(:user) }
  let(:group)  { create(:group) }
  let!(:message) { create(:message, user: user) }

  before { sign_in user }

  describe 'GET index' do
    before { get :index }

    it { expect(response).to have_http_status(:success) }
    it { expect(json.first['body']).to eq(message.body) }
  end

  describe 'GET #show' do
    before { get :show, params: { id: message.id } }

    it { is_expected.to respond_with :success }
    it { expect(json['data']['attributes']['body']).to eq(message.body) }
  end

  describe 'PATCH update' do
    let(:update_params) do
      { message: { id: message.id, body: 'New message body' } }
    end

    before { put :update, params: update_params } # TODO fix problem with update path

    xit { expect(response).to have_http_status(:success) }
  end

  describe 'POST create' do
    let(:create_params) do
      { message: { body: 'New Message', user: user, group: group } }
    end

    before { post :create, params: create_params }

    it { expect(Message.all.count).to eq 2 }
  end

end

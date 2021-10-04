require 'rails_helper'

RSpec.describe Api::GroupsController, type: :controller do
  let(:user)   { create(:user) }
  let(:user2) { create(:user) }
  let!(:group) { create(:group, users: [user2]) }

  before { sign_in user }

  describe 'GET index' do
    before { get :index }

    it { expect(response).to have_http_status(:success) }
    it { expect(json.first['name']).to eq(group.name) }
  end

  describe 'GET #show' do
    before { get :show, params: { id: group.id } }

    it { is_expected.to respond_with :success }
  end

  describe 'PATCH update' do
    let(:update_params) do
      { group: { id: group.id, name: 'New Group Name' } }
    end

    before { patch :update, params: update_params }

    xit { expect(response).to have_http_status(:success) } # TODO fix problem with update path
  end

  describe 'POST join_group' do
    before { post :join_group, params: { id: group.id } }

    it { expect(response).to have_http_status(:success) }
    it { expect(response.body).to eq('User has been added to the group') }
  end

  describe 'POST create' do
    let!(:user) { create(:user) }
    let(:create_params) do
      { group: { name: 'New group',
                 description: 'New group description',
                 user_ids: [user.id] } }
    end

    before { post :create, params: create_params }

    it { expect(Group.all.count).to eq 2 }
  end

end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Routing', type: :routing do
  describe 'Message' do
    let(:p) { '/api/messages/1' }
    let(:c) { 'api/messages' }

    it 'routes to #index' do
      expect(get: c).to route_to(format: :json, controller: c, action: 'index')
    end

    it 'routes to #show' do
      expect(get: p).to route_to(format: :json, controller: c, action: 'show', id: '1')
    end

    it 'routes to #create' do
      expect(post: c).to route_to(format: :json, controller: c, action: 'create')
    end

    it 'routes to #update via PUT' do
      expect(put: p).to route_to(format: :json, controller: c, action: 'update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: p).to route_to(format: :json, controller: c, action: 'update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: p).to route_to(format: :json, controller: c, action: 'destroy', id: '1')
    end
  end

  describe 'Group' do
    let(:p) { '/api/groups/1' }
    let(:c) { 'api/groups' }

    it 'routes to #index' do
      expect(get: c).to route_to(format: :json, controller: c, action: 'index')
    end

    it 'routes to #show' do
      expect(get: p).to route_to(format: :json, controller: c, action: 'show', id: '1')
    end

    it 'routes to #create' do
      expect(post: c).to route_to(format: :json, controller: c, action: 'create')
    end

    it 'routes to #update via PUT' do
      expect(put: p).to route_to(format: :json, controller: c, action: 'update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: p).to route_to(format: :json, controller: c, action: 'update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: p).to route_to(format: :json, controller: c, action: 'destroy', id: '1')
    end
  end

  describe 'User' do
    let(:p) { '/api/users/1' }
    let(:c) { 'api/users' }

    it 'routes to #index' do
      expect(get: c).to route_to(format: :json, controller: c, action: 'index')
    end

    it 'routes to #show' do
      expect(get: p).to route_to(format: :json, controller: c, action: 'show', id: '1')
    end
  end

end

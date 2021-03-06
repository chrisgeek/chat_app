require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:group).optional }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:body) }
  end
end

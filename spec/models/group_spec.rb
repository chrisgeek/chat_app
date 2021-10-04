require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:messages) }
    it { is_expected.to have_and_belong_to_many(:users) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end
end

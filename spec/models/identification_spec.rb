require 'rails_helper'

RSpec.describe Identification, type: :model do
  subject { build(:identification) }

  describe 'association' do
    it { is_expected.to belong_to(:user) }
  end

  describe '#number' do
    it { is_expected.to have_db_column(:number) }
    it { is_expected.to have_db_index(:number) }
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_length_of(:number).is_at_most(120) }
  end

  describe '#state' do
    it { is_expected.to have_db_column(:state) }
    it { is_expected.to have_db_index(:state) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_length_of(:state).is_at_most(2) }
  end

  describe '#expiration' do
    it { is_expected.to have_db_column(:expiration) }
  end

  describe '#is_expired' do
    it 'when date is in past' do
      subject.expiration = 5.days.ago
      expect(subject.is_expired?).to eq(true)
    end

    it 'when date is in future' do
      subject.expiration = 5.days.from_now
      expect(subject.is_expired?).to eq(false)
    end
  end
end

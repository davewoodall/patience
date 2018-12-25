require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  describe '#name' do
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_index(:name) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(120) }
  end

  describe '#email' do
    it { is_expected.to have_db_column(:email) }
    it { is_expected.to have_db_index(:email) }
    it { is_expected.to validate_presence_of(:email) }
  end

  describe '#dob' do
    it { is_expected.to have_db_column(:dob) }
    it { is_expected.to validate_presence_of(:dob) }
  end
end

require 'rails_helper'

RSpec.describe AdopterAccount, type: :model do
  describe "associations" do
    it { should have_one(:adopter_profile).dependent(:destroy) }
    it { should have_many(:adopter_applications).dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(8) }
  end

  describe "callbacks" do
    it { should callback(:create_adopter_profile).after(:create) }
  end

  describe "#create_adopter_profile" do
    it "creates an adopter profile for the account" do
      account = create(:adopter_account)

      expect(account.adopter_profile).to be_present
    end
  end
end
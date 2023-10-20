require "rails_helper"

RSpec.describe Organization, type: :model do
  context "associations" do
    it { should have_many(:staff_accounts) }
    it { should have_many(:users).through(:staff_accounts) }
    it { should have_many(:pets) }
  end
end

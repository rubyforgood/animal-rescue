require "rails_helper"

RSpec.describe MessagesHelper do
  describe ".affirmations" do
    it "returns an array of affirmations" do
      affirmations = MessagesHelper.affirmations
      expect(affirmations).to be_an(Array)
      expect(affirmations).not_to be_empty
    end

    it 'includes "Woof woof."' do
      affirmations = MessagesHelper.affirmations
      expect(affirmations).to include("Woof woof.")
    end
  end
end

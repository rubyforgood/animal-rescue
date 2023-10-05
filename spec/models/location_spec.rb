require 'rails_helper'

RSpec.describe Location, type: :model do

  describe "validations" do
    it 'is invalid without a country' do
      location = build(:location, country: nil)
      location.valid?
      expect(location.errors[:country]).to include("Please enter a country")
    end

    it 'is invalid with a country over 50 characters' do
      location = build(:location, country: "a" * 51)
      location.valid?
      expect(location.errors[:country]).to include("50 characters maximum")
    end

    it 'is invalid without a city or town' do
      location = build(:location, city_town: nil)
      location.valid?
      expect(location.errors[:city_town]).to include("Please enter a city or town")
    end

    it 'is invalid with a city or town over 50 characters' do
      location = build(:location, city_town: "a" * 51)
      location.valid?
      expect(location.errors[:city_town]).to include("50 characters maximum")
    end

    it 'is invalid without a province or state' do
      location = build(:location, province_state: nil)
      location.valid?
      expect(location.errors[:province_state]).to include("Please enter a province or state")
    end

    it 'is invalid with a province or state over 50 characters' do
      location = build(:location, province_state: "a" * 51)
      location.valid?
      expect(location.errors[:province_state]).to include("50 characters maximum")
    end

    it 'is valid with a country, city or town, and province or state' do
      location = build(:location)
      expect(location).to be_valid
    end

    it 'is invalid without an adopter profile' do
      location = build(:location, adopter_profile: nil)
      location.valid?
      expect(location.errors[:adopter_profile]).to include("must exist")
    end

    it 'is valid with an adopter profile' do
      location = build(:location)
      expect(location).to be_valid
    end

  end
end
require 'rails_helper'

RSpec.describe Donation, type: :model do
  context 'validations' do
    context 'when there are no amount and/or currency values' do
      it 'requires the presence of amount and currency' do
        donation = Donation.new
        donation.valid?
        expect(donation.errors[:amount]).to include("can't be blank")
        expect(donation.errors[:currency]).to include("can't be blank")
      end
    end
  end

  describe '.sum_donations_by_currency' do
    context 'when the amount values valid numbers' do
      before do
        Donation.create!(amount: '5', currency: 'biscuits')
        Donation.create!(amount: '2', currency: 'biscuits')
        Donation.create!(amount: '10', currency: 'treats')
      end

      it 'returns the sum of donations by currency' do
        expected = { 'biscuits' => 7, 'treats' => 10 }
        expect(Donation.sum_donations_by_currency).to eq(expected)
      end
    end

    context 'when amount is not a valid number' do
      before do
        Donation.create!(amount: '5', currency: 'USD')
        Donation.create!(amount: 'invalid', currency: 'USD')
        Donation.create!(amount: '10', currency: 'EUR')
      end

      it 'ignores the invalid amount and sums the valid amounts' do
        expected = { 'USD' => 5.0, 'EUR' => 10.0 }
        expect(Donation.sum_donations_by_currency).to eq(expected)
      end
    end

    context 'when there are no donations' do
      it 'returns an empty hash' do
        expect(Donation.sum_donations_by_currency).to eq({})
      end
    end
  end
end

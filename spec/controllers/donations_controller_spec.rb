require 'rails_helper'

RSpec.describe DonationsController, type: :controller do
  describe "POST #create" do
    context "with valid params" do
      let(:paypal_response) { { amount: 10.0, currency: "USD" } }
      let(:mapped_response) { instance_double("PaypalResponseMapper", map: paypal_response) }

      before do
        allow(DonationsController::PaypalResponseMapper).to receive(:new).and_return(mapped_response)
        post :create, params: { source: "Paypal" }
      end

      it "creates a new donation" do
        expect(Donation.count).to eq(1)
      end

      it "sets the attributes of the donation" do
        donation = Donation.last
        expect(donation.amount).to eq(paypal_response[:amount].to_s)
        expect(donation.currency).to eq(paypal_response[:currency])
      end

      it "returns a success response" do
        expect(response).to be_successful
      end
    end

    context "with invalid params" do
      before do
        post :create, params: { source: "Invalid" }
      end

      it "does not create a new donation" do
        expect(Donation.count).to eq(0)
      end

      it "returns an unprocessable entity response" do
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
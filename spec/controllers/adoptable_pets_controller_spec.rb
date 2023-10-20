require 'rails_helper'

RSpec.describe AdoptablePetsController, type: :request do
  describe 'GET #index' do
  it 'returns a successful response' do
    get adoptable_pets_path
    expect(response).to be_successful
  end

  it 'returns a list of pets' do
    pet = create(:pet)
    get adoptable_pets_path
    expect(response.body).to include(pet.name)
  end
end

  describe 'GET #show' do
    let(:pet) { create(:pet) }

    it 'returns a successful response' do
      get adoptable_pet_path(pet)
      expect(response).to be_successful
    end

    context 'when the pet has a match' do
      let!(:match) { create(:match, pet: pet, organization: pet.organization) }

      it 'redirects to the index page with an alert' do
        get adoptable_pet_path(pet)
        expect(response).to redirect_to(adoptable_pets_path)
        expect(flash[:alert]).to eq('You can only view pets that need adoption.')
      end
    end

    context 'when the pet does not have a match' do
      it 'does not redirect' do
        get adoptable_pet_path(pet)
        expect(response).not_to redirect_to(adoptable_pets_path)
      end
    end
  end
end

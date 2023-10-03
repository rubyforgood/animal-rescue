require 'rails_helper'

RSpec.describe 'AdopterProfileForms', type: :system do
  it 'displays text areas after radio check, all text areas have character counter, and text areas disappear after radio check' do
    user = create(:user, :adopter_with_profile)
    sign_in user
    visit profile_path
    click_on 'Edit Profile'

    expect(page).to have_selector('h1', text: 'EDIT PROFILE')

    fill_in 'Briefly describe your ideal pet', with: 'Big and fluffy.'
    fill_in 'Briefly describe your lifestyle', with: 'Big and fluffy.'
    fill_in 'Briefly describe activities you will do with your pet', with: 'Big and fluffy.'
    fill_in 'Briefly describe your pet care experience', with: 'Big and fluffy.'
    fill_in 'Who will care for your pet during emergencies or vacations?', with: 'Big and fluffy.'

    find('label[for=adopter_profile_other_pets_true]').click
    find('label[for=adopter_profile_shared_ownership_true]').click
    find('label[for=adopter_profile_fenced_access_false]').click
    find('label[for=adopter_profile_surrendered_pet_true]').click

    fill_in 'How do you plan to care for the pet without a fenced garden?', with: 'Big and fluffy.'
    fill_in 'List pets (include neuter status if pet)', with: 'Big and fluffy.'
    fill_in 'Briefly describe who else will share pet ownership', with: 'Big and fluffy.'
    fill_in 'Briefly describe the circumstances around surrenderring or rehoming the pet', with: 'Big and fluffy.'

    expect(page).to have_selector('div.small', text: '15/200', count: 9)
    expect(page).to have_selector('textarea', count: 9)

    find('label[for=adopter_profile_other_pets_false]').click
    find('label[for=adopter_profile_shared_ownership_false]').click
    find('label[for=adopter_profile_fenced_access_true]').click
    find('label[for=adopter_profile_surrendered_pet_false]').click

    expect(page).to have_selector('textarea', count: 5)
  end
end

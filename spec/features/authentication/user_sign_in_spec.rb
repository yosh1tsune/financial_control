require 'rails_helper'

feature 'user sign up', js: true do
  let!(:user) { create(:user) }

  scenario 'successfully' do
    visit root_path
    click_on I18n.t('sign_in')
    fill_in I18n.t('activerecord.attributes.user.email'), with: user.email
    fill_in I18n.t('activerecord.attributes.user.password'), with: user.password
    click_on I18n.t('sign_in')

    expect(current_path).to eq(root_path)
    expect(page).to have_content(I18n.t('devise.sessions.signed_in'))
  end

  scenario 'fail if wrong password' do
    visit root_path
    click_on I18n.t('sign_in')
    fill_in I18n.t('activerecord.attributes.user.email'), with: user.email
    fill_in I18n.t('activerecord.attributes.user.password'), with: ''
    click_on I18n.t('sign_in')

    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_content(
      I18n.t(
        'devise.failure.invalid',
        authentication_keys: I18n.t('activerecord.attributes.user.email')
      )
    )
  end
end

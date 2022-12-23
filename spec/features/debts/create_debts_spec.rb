require 'rails_helper'

feature 'create debts' do
  let(:user) { create(:user) }
  let!(:wallet) { create(:wallet, user: user) }

  scenario 'successfully' do
    login_as(user)
    visit root_path
    click_on I18n.t('create_debt')
    fill_in I18n.t('activerecord.attributes.debt.value'), with: 1_234.56
    fill_in I18n.t('activerecord.attributes.debt.date'), with: Date.current
    click_on I18n.t('create_debt')


    expect(current_path).to eq root_path
    expect(page).to have_content('Débito adicionado com sucesso')
  end

  scenario 'fail if required parameters not filled' do
    login_as(user)
    visit root_path
    click_on I18n.t('create_debt')
    fill_in I18n.t('activerecord.attributes.debt.value'), with: ''
    fill_in I18n.t('activerecord.attributes.debt.date'), with: ''
    click_on I18n.t('create_debt')

    expect(page).to have_content('Erro')
  end
end

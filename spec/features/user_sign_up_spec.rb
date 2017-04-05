require 'rails_helper'

feature 'User Sign-up' do

  scenario 'successfully' do
    #setup
    user = User.new(name: 'Jenifer Spinoza',
                    email: 'jenyspa@gmail.com')

    #execution
    visit root_path
    click_on 'Sign up'
    fill_in 'Nome',   with: user.name
    fill_in 'E-mail', with: user.email

    #expectation
    expect(page).to have_content('Cadastro efetuado com sucesso')

    have_link('Sign in', root_path)

  end

end

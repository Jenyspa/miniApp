require 'rails_helper'

feature 'User logout system' do

  scenario 'successfully' do
    #setup
    user = User.create(name: 'Jenifer Spinoza',
                    email: 'jenyspa@gmail.com',
                    password: '123456')
    #execution
    visit root_path
    fill_in 'E-mail', with: user.email
    fill_in 'Senha',  with: user.password
    click_on 'Log in'
    click_on 'Logout'

    #expectation
    expect(current_path).to eq user_session_path

  end

end

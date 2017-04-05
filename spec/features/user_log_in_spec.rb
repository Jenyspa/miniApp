require 'rails_helper'

feature 'User logout system' do

  scenario 'successfully' do
    #setup
    user = User.create(name: 'Jenifer Spinoza',
                    email: 'jenyspa@gmail.com',
                    password: '123456')
    #execution
    visit root_path
    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    #expectation
    expect(current_path).to eq root_path
  end

end

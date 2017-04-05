require 'rails_helper'

feature 'User Sign-up' do

  scenario 'successfully' do
    #setup
    user = User.new(name: 'Jenifer Spinoza',
                    email: 'jenyspa@gmail.com')

    #execution
    visit root_path
    click_on 'Sign up'
    fill_in 'Name',   with: user.name
    fill_in 'Email', with: user.email

    #expectation
    have_link('Sign in', root_path)

  end

end

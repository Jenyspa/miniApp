require 'rails_helper'

feature 'User edit Todo List' do

  scenario 'successfully' do
    #setup
    user = User.create(name: 'Jenifer Spinoza',
                    email: 'jenyspa@gmail.com',
                    password: '123456')
    list = List.create(name: 'To Do List',
                    privacy: 'Privada')
    task = Task.new(description: 'Ir ao banco')
    #execution
    visit root_path
    fill_in 'E-mail',    with: user.email
    fill_in 'Senha',    with: user.password
    click_on 'Log in'
    click_on 'To Do List'
    #expectation
    expect(page).to have_content(list.name)
    expect(page).to have_content(task.description)
    expect(page).to have_content(another_task.description)
    expect(page).to have_content(list.privacy)
    have_link 'Editar'
  end

  scenario 'User edit todo list' do
    #setup
    user = User.create(name: 'Jenifer Spinoza',
                    email: 'jenyspa@gmail.com',
                    password: '123456')
    list = List.create(name: 'To Do List',
                    privacy: 'Privada')
    task = Task.new(description: 'Ir ao banco')
    #execution
    visit root_path
    fill_in 'E-mail',    with: user.email
    fill_in 'Senha',    with: user.password
    click_on 'Log in'
    click_on 'To Do List'
    click_on 'Editar'
    fill_in 'Nome da Lista', with: 'Nova Todo List'
    click_on 'Atualizar'
    #expectation
    expect(page).to have_content('Nova Todo List')

  end

end

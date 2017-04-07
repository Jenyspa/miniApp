require 'rails_helper'

feature 'User creates todo list' do

  scenario 'successfully' do
    #setup
    user = User.create(name: 'Jenifer Spinoza',
                    email: 'jenyspa@gmail.com',
                    password: '123456')

    list = List.new(name: 'To Do List',
                    privacy: 'Privada')
    #execution
    visit root_path
    fill_in 'E-mail', with: user.email
    fill_in 'Senha',  with: user.password
    click_on 'Log in'

    click_on 'Criar Lista'
    fill_in 'Nome da Lista',  with: list.name

    choose list.privacy
    click_on 'Salvar'
    #expectation
    expect(page).to have_content(list.name)
    expect(page).to have_content(list.privacy)
  end

  scenario 'with two tasks' do
    user = User.create(name: 'Jenifer Spinoza',
                    email: 'jenyspa@gmail.com',
                    password: '123456')
    list = List.new(name: 'To Do List',
                  privacy: 'Privada')
    task = Task.new(description: 'Ir ao banco')
    another_task = Task.new(description: 'Ir ao mercado')
    #execution
    visit root_path
    fill_in 'E-mail',    with: user.email
    fill_in 'Senha',    with: user.password
    click_on 'Log in'

    click_on 'Criar Lista'
    fill_in 'Nome da Lista',  with: list.name
    fill_in 'list_tasks_attributes_0_description',         with: task.description
    fill_in 'list_tasks_attributes_1_description',         with: another_task.description
    choose list.privacy
    click_on 'Salvar'
    #expectation
    expect(page).to have_content(list.name)
    expect(page).to have_content(task.description)
    expect(page).to have_content(another_task.description)
    expect(page).to have_content(list.privacy)
  end
end

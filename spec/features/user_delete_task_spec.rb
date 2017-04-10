require 'rails_helper'

feature 'User delete task from list' do

  scenario 'successfully' do
    #setup
    user = User.create(name: 'Jenifer Spinoza',
                    email: 'jenyspa@gmail.com',
                    password: '123456')
    list = List.create(name: 'To Do List',
                    privacy: 'Privada')
    task = Task.new(description: 'Ir ao banco')
    another_task = Task.new(description: 'Ir ao mercado')
    #execution
    visit root_path
    fill_in 'E-mail',    with: user.email
    fill_in 'Senha',    with: user.password
    click_on 'Log in'
    click_on 'To Do List'
    click_on 'Editar'
    click_on 'Deletar'
    #expectation
    expect(current_path).to eq root_path
    expect(page).to have_content("Tarefa deletada")
    expect(page).to have_content(list.name)
    expect(page).to have_content(task.description)
    expect(page).to have_content(list.privacy)
    have_link 'Atualizar'
  end

end

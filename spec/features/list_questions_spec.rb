require 'rails_helper'

feature "see questions" do
  scenario "see all the questions" do
    user = FactoryGirl.create(:user)
    q1 = Question.create(name: "What's the deal with BugsWhat's the deal with BugsWhat's the deal with BugsWhat's the deal with Bugs", user: user)
    q2 = Question.create(name: "It won't work??It won't work??It won't work??It won't work??It won't work??It won't work??It won't work??It won't work??" , user: user)

    visit questions_path
    expect(page).to have_content(q1.name)
    expect(page).to have_content(q2.name)
  end
end

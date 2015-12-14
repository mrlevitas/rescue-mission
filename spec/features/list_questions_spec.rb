require 'rails_helper'

feature "see questions" do
  scenario "see all the questions" do
    q1 = Question.create(name: "What's the deal with Bugs")
    q2 = Question.create(name: "It won't work??")

    visit questions_path
    expect(page).to have_content(q1.name)
    expect(page).to have_content(q2.name)
  end
end

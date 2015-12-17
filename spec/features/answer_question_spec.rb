require 'rails_helper'

feature "answers a question" do
  scenario "user visits question show page and answers the questions" do
    user = FactoryGirl.create(:user)
    q1 = Question.create!(name: "What's the deal with Bugs? What's the deal with Bugs? What's the deal with Bugs? What's the deal with Bugs?" , user: user)
    # q2 = Question.create(name: "It won't work??")
    a1 = "Bugs are a well known phenomenom by the Inca culture long long time ago. This is the best answer to this question and it's 50 characters long or more."
    # visit questions_path
    # visit '/'
    sign_in_as user
    click_link(q1.name)
    fill_in("answer_description" , with: a1)
    click_button("Post Answer")
    expect(page).to have_content(a1)
  end
end

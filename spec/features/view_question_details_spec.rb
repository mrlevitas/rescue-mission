require 'rails_helper'

feature "see question details" do
  scenario "clicking on a question goes to its details page" do
    q1 = Question.create(name: "What's the deal with BugsWhat's the deal with BugsWhat's the deal with BugsWhat's the deal with Bugs", description: "These bugs are pretty buggy. Please help!These bugs are pretty buggy. Please help!These bugs are pretty buggy. Please help!These bugs are pretty buggy. Please help!These bugs are pretty buggy. Please help!These bugs are pretty buggy. Please help!These bugs are pretty buggy. Please help!These bugs are pretty buggy. Please help!These bugs are pretty buggy. Please help!These bugs are pretty buggy. Please help!")
    # q2 = Question.create(name: "It won't work??", description: "What's the deal with airplane food?")
    visit questions_path
    click_link(q1.name)
    expect(page).to have_content(q1.description)
  end
end

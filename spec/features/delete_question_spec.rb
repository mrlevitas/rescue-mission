# As a user
# I want to delete a question
# So that I can delete duplicate questions
#
# Acceptance Criteria
#
# - I must be able delete a question from the question edit page
# - I must be able delete a question from the question details page
# - All answers associated with the question must also be deleted
require 'rails_helper'

feature "delete a question" do
  scenario "user visits question show page and deletes the question" do
    string1 = "What's the deal with all these bugs???What's the deal with all these bugs???What's the deal with all these bugs???"
    string2 = "THere's this bug in my soup and I don't know how to get it out. Please halp.THere's this bug in my soup and I don't know how to get it out. Please halp."
    string3 = "My computer won't turn on...what do I do?My computer won't turn on...what do I do?My computer won't turn on...what do I do?My computer won't turn on...what do I do?My computer won't turn on...what do I do?"
    # string4 = "I push the button and nothing happens."
    user = FactoryGirl.create(:user)
    q1 = Question.create(name: string1, description: string2, user: user)
    a1 = Answer.create(description: string3, question: q1, user: user)
    # visit questions_path
    sign_in_as user
    click_link(q1.name)
    click_button("delete")
    expect(page).to_not have_content(string1)

  end
  scenario "user visits question show page and deletes the question" do
    string1 = "What's the deal with all these bugs???What's the deal with all these bugs???What's the deal with all these bugs???"
    string2 = "THere's this bug in my soup and I don't know how to get it out. Please halp.THere's this bug in my soup and I don't know how to get it out. Please halp."
    string3 = "My computer won't turn on...what do I do?My computer won't turn on...what do I do?My computer won't turn on...what do I do?My computer won't turn on...what do I do?My computer won't turn on...what do I do?"
    # string4 = "I push the button and nothing happens."
    user = FactoryGirl.create(:user)
    q1 = Question.create(name: string1, description: string2, user: user)
    a1 = Answer.create(description: string3, question: q1, user: user)
    sign_in_as user
    click_link(q1.name)
    click_link("edit")
    expect(Answer.all).to include(a1)
    click_button("delete")
    expect(page).to_not have_content(string1)
    expect(Answer.all).to_not include(a1)
  end
end

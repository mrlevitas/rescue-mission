# As a user
# I want to edit a question
# So that I can correct any mistakes or add updates
#
# Acceptance Criteria
#
# - I must provide valid information
# - I must be presented with errors if I fill out the form incorrectly
# - I must be able to get to the edit page from the question details page
require 'rails_helper'

feature "edit a question" do
  scenario "user visits question show page and edits the question on separate page" do
    user = FactoryGirl.create(:user)
    string1 = "What's the deal with all these bugs???What's the deal with all these bugs???What's the deal with all these bugs???"
    string2 = "THere's this bug in my soup and I don't know how to get it out. Please halp.THere's this bug in my soup and I don't know how to get it out. Please halp."
    string3 = "My computer won't turn on...what do I do?My computer won't turn on...what do I do?My computer won't turn on...what do I do?My computer won't turn on...what do I do?My computer won't turn on...what do I do?"
    string4 = "I push the button and nothing happens.I push the button and nothing happens. I push the button and nothing happens. I push the button and nothing happens. I push the button and nothing happens. I push the button and nothing happens. I push the button and nothing happens. I push the button and nothing happens.I push the button and nothing happens.I push the button and nothing happens."
    q1 = Question.create(name: string1, description: string2, user: user)
    sign_in_as user
    visit questions_path
    click_link(q1.name)
    click_link("edit")
    fill_in("question_name" , with: string3)
    fill_in("question_description" , with: string4)
    click_button("Edit Question")
    expect(page).to_not have_content(string1)
    expect(page).to_not have_content(string2)
    expect(page).to have_content(string3)
    expect(page).to have_content(string4)
  end

  scenario "user visits question show page and edits the question on separate page incorrectly" do
    user = FactoryGirl.create(:user)
    string1 = "What's the deal with all these bugs???What's the deal with all these bugs???What's the deal with all these bugs???"
    string2 = "THere's this bug in my soup and I don't know how to get it out. Please halp.THere's this bug in my soup and I don't know how to get it out. Please halp."
    string3 = "My computer won't turn on...what do I do?"
    string4 = "I push the button and nothing happens."
    error = "Please fill the form in correctly: min 40 char for name and 150 for description"
    q1 = Question.create(name: string1, description: string2, user: user)
    sign_in_as user
    visit questions_path
    click_link(q1.name)
    click_link("edit")
    fill_in("question_name" , with: string3)
    fill_in("question_description" , with: string4)
    click_button("Edit Question")
    # expect(page).to_not have_content(string1)
    # expect(page).to_not have_content(string2)
    expect(page).to have_content(error)
    expect(page).to_not have_content(string3)
    expect(page).to_not have_content(string4)
  end
end

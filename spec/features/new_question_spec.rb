require 'rails_helper'
feature "add new question" do
  scenario "clicking on new button, fill in form, and submit if satisfies requirements" do
    user = FactoryGirl.create(:user)
    string1 = "my pc is on fire my pc is on fire my pc is on fire my pc is on fire my pc is on fire my pc is on fire my pc is on fire"
    string2 = "and it won't turn offffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"
    sign_in_as user
    visit questions_path
    click_link("new")
    fill_in("question_name" , with: string1)
    fill_in("question_description" , with: string2)

    click_button("Create")
    expect(page).to have_content(string1)
    click_link(string1)
    expect(page).to have_content(string2)

  end
end

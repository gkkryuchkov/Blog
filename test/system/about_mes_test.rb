require "application_system_test_case"

class AboutMeTest < ApplicationSystemTestCase
  setup do
    @about_mes = about_mess(:one)
  end

  test "visiting the index" do
    visit about_mess_url
    assert_selector "h1", text: "About Mes"
  end

  test "creating a About me" do
    visit about_mess_url
    click_on "New About Me"

    click_on "Create About me"

    assert_text "About me was successfully created"
    click_on "Back"
  end

  test "updating a About me" do
    visit about_mess_url
    click_on "Edit", match: :first

    click_on "Update About me"

    assert_text "About me was successfully updated"
    click_on "Back"
  end

  test "destroying a About me" do
    visit about_mess_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "About me was successfully destroyed"
  end
end

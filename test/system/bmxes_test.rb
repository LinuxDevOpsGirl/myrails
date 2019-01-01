require "application_system_test_case"

class BmxesTest < ApplicationSystemTestCase
  setup do
    @bmx = bmxes(:one)
  end

  test "visiting the index" do
    visit bmxes_url
    assert_selector "h1", text: "Bmxes"
  end

  test "creating a Bmx" do
    visit bmxes_url
    click_on "New Bmx"

    fill_in "String", with: @bmx.string
    click_on "Create Bmx"

    assert_text "Bmx was successfully created"
    click_on "Back"
  end

  test "updating a Bmx" do
    visit bmxes_url
    click_on "Edit", match: :first

    fill_in "String", with: @bmx.string
    click_on "Update Bmx"

    assert_text "Bmx was successfully updated"
    click_on "Back"
  end

  test "destroying a Bmx" do
    visit bmxes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bmx was successfully destroyed"
  end
end

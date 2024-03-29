require "application_system_test_case"

class OfficesTest < ApplicationSystemTestCase
  setup do
    @office = offices(:one)
  end

  test "visiting the index" do
    visit offices_url
    assert_selector "h1", text: "Offices"
  end

  test "creating a Office" do
    visit offices_url
    click_on "New Office"

    fill_in "City", with: @office.city
    fill_in "Country", with: @office.country
    fill_in "Ext number", with: @office.ext_number
    fill_in "Int number", with: @office.int_number
    fill_in "Name", with: @office.name
    fill_in "Neighborhood", with: @office.neighborhood
    fill_in "Postal code", with: @office.postal_code
    fill_in "Street", with: @office.street
    fill_in "User", with: @office.user_id
    click_on "Create Office"

    assert_text "Office was successfully created"
    click_on "Back"
  end

  test "updating a Office" do
    visit offices_url
    click_on "Edit", match: :first

    fill_in "City", with: @office.city
    fill_in "Country", with: @office.country
    fill_in "Ext number", with: @office.ext_number
    fill_in "Int number", with: @office.int_number
    fill_in "Name", with: @office.name
    fill_in "Neighborhood", with: @office.neighborhood
    fill_in "Postal code", with: @office.postal_code
    fill_in "Street", with: @office.street
    fill_in "User", with: @office.user_id
    click_on "Update Office"

    assert_text "Office was successfully updated"
    click_on "Back"
  end

  test "destroying a Office" do
    visit offices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Office was successfully destroyed"
  end
end

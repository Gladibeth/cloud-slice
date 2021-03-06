require "application_system_test_case"

module KepplerCapsules
  class ServersTest < ApplicationSystemTestCase
    setup do
      @server = keppler_capsules_servers(:one)
    end

    test "visiting the index" do
      visit servers_url
      assert_selector "h1", text: "Servers"
    end

    test "creating a Server" do
      visit servers_url
      click_on "New Server"

      fill_in "Deleted At", with: @server.deleted_at
      fill_in "Name", with: @server.name
      fill_in "Position", with: @server.position
      click_on "Create Server"

      assert_text "Server was successfully created"
      click_on "Back"
    end

    test "updating a Server" do
      visit servers_url
      click_on "Edit", match: :first

      fill_in "Deleted At", with: @server.deleted_at
      fill_in "Name", with: @server.name
      fill_in "Position", with: @server.position
      click_on "Update Server"

      assert_text "Server was successfully updated"
      click_on "Back"
    end

    test "destroying a Server" do
      visit servers_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Server was successfully destroyed"
    end
  end
end

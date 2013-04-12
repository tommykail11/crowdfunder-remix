require 'test_helper'

class PledgeFlowsTest < ActionDispatch::IntegrationTest
  
  setup do
    @project = FactoryGirl.create :project    
  end

  test "requires authenticated user" do 
    visit project_path(@project)

    click_button 'Pledge Now'

    assert_equal new_session_path, current_path
    assert page.has_content?("Please sign in")
  end

  test "authenticated user can pledge valid amount" do 
    user = get_signed_in_user

    visit project_path(@project)
    fill_in 'pledge[amount]', with: 100
    click_button 'Pledge Now'

    # Should be Redirected back to project page with thank you message
    assert_equal project_path(@project), current_path
    assert page.has_content?("Nice!")

    # Verify that the pledge was created with the right attributes
    assert pledge = Pledge.order(:id).last
    assert_equal user, pledge.user
    assert_equal @project, pledge.project
    assert_equal 100, pledge.amount
  end

end
require 'spec_helper'

describe "Static pages" do  #integration testing for static_pages controller

#  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  subject { page } # Instead of page.should, allows "it" = page

  shared_examples_for "all static pages" do  # allows for use of 'it_should_behave_like'
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

    # Let the integration testing begin!

  describe "Home page" do
    before { visit root_path } # do this b4 other tests
    let(:heading)    { 'Sample App' } # local vars
    let(:page_title) { '' }

    it_should_behave_like "all static pages" # used with 'shared_examples_for'

    it { should_not have_title('| Home') }
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading) { 'Help'}
    let(:page_title) { 'Help' }

    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }
    let(:heading) { 'About' }
    let(:page_title) { 'About' }
    
    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading) { 'Contact' }
    let(:page_title) { 'Contact' }

    it_should_behave_like "all static pages"
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_title(full_title('About Us'))
    click_link "Help"
    page.should have_title(full_title('Help'))
    click_link "Contact"
    page.should have_title(full_title('Contact'))
    click_link "Home"
    click_link "Sign up now!"
    page.should have_title(full_title('Sign up'))
    click_link "sample app"
#   page.should have_title(full_title) <-- will pass once there's a Sign Up page
  end
end

require 'spec_helper'

describe User do

	before { @user = User.new(name: "Example User", email: "user@example.com") }

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }

	it { should be_valid } # verifies @user obj is initially valid
# When obj responds to valid?, corresponding test method 'be_valid'

	describe "when name is not present" do
		before { @user.name = " " } # Invalidates @user
		it { should_not be_valid } # Test for invalidation
	end

	describe "when email is not present" do
		before { @user.email = " " } # Invalidates @user
		it { should_not be_valid } # Tests for invalidation
	end

	describe "when name is too long" do
		before { @user.name = "a"*51 } # Name too long
		it { should_not be_valid } # Tests for invalidation
	end
end

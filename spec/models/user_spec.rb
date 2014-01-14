require 'spec_helper'

describe User do

	before do
		@user = User.new(name: "Example User", email: "user@example.com")
	end

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

	describe "when email format is invalid" do
		it "should be valid" do
			addresses = %w[user@foo,com user_at_foo.org exaple.user@foo. foo@bar_baz.com foo@bar+baz.com]
			addresses.each do |invalid_address|
				@user.email = invalid_address
				@user.should_not be_valid
			end
		end
	end

	describe "when email format is valid" do
		it "should be valid" do
			addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
			addresses.each do |valid_address|
				@user.email = valid_address
				@user.should be_valid
			end
		end
	end

	describe "when email address is already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end

		it { should_not be_valid }
	end
end

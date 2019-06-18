require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
      it 'should not be able to be created without a password' do
        @input = {
          first_name: "Greg",
          last_name: "Leader",
          email: "leaderg@gmail.com",
          password: nil,
          password_confirmation: "password"}
        @user = User.create(@input)

        expect(@user).to_not be_valid
      end

      it 'should not be able to be created without a password confirmation' do   #
        @input = {
          first_name: "Greg",
          last_name: "Leader",
          email: "leaderg@gmail.com",
          password: "password",
          password_confirmation: nil}
        @user = User.create(@input)

        expect(@user).to_not be_valid
      end

      it 'should not be able to be created without a password and password confirmation fields' do   #
        @input = {
          first_name: "Greg",
          last_name: "Leader",
          email: "leaderg@gmail.com",
          password: nil,
          password_confirmation: nil}
        @user = User.create(@input)

        expect(@user).to_not be_valid
      end

      it 'should not create if email is not unique - case sensitive' do   #
        User.create(first_name: "Mark", last_name: "Zuck", email: "leaderg@gmail.com",password: "a", password_confirmation: "a")
        @input = {
          first_name: "Greg",
          last_name: "Leader",
          email: "leaderg@gmail.com",
          password: "password",
          password_confirmation: "password"}
        @user = User.create(@input)

        expect(@user).to_not be_valid
      end

      it 'should not create if email is not unique - case insensitive' do   #
        User.create(first_name: "Mark", last_name: "Zuck", email: "LEaDerG@gmail.com",password: "a", password_confirmation: "a")
        @input = {
          first_name: "Greg",
          last_name: "Leader",
          email: "leaderg@gmail.com",
          password: "password",
          password_confirmation: "password"}
        @user = User.create(@input)

        expect(@user).to_not be_valid
      end

      it 'should not create if email is missing' do   #
        @input = {
          first_name: "Greg",
          last_name: "Leader",
          email: nil,
          password: "password",
          password_confirmation: "password"}
        @user = User.create(@input)

        expect(@user).to_not be_valid
      end

      it "Should reject a password with less than 5 characters" do
        @input = {
          first_name: "Greg",
          last_name: "Leader",
          email: "leader.g@gmail.com",
          password: "pass",
          password_confirmation: "pass"}
        @user = User.create(@input)

        expect(@user).to_not be_valid
      end

      it 'should not create if first name is missing' do   #
        @input = {
          first_name: nil,
          last_name: "Leader",
          email: "leaderg@gmail.com",
          password: "password",
          password_confirmation: "password"}
        @user = User.create(@input)

        expect(@user).to_not be_valid
      end

      it 'should not create if last name is missing' do   #
        @input = {
          first_name: "Greg",
          last_name: nil,
          email: "leaderg@gmail.com",
          password: "password",
          password_confirmation: "password"}
        @user = User.create(@input)

        expect(@user).to_not be_valid
      end

  end
end

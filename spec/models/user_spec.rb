require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'Create new user' do
    context 'When a new user can be added' do
      it 'all required info is filled in' do
        expect(@user).to be_valid
      end
    end
end

context 'When the user cannot ce created' do
  it 'The email cannot be blank' do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end
  it 'The email must have an @' do
    @user.email = 'testgmail'
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
  end
  it 'Emails cannot be the same' do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
  end
  it 'The password cannot be blank' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end
  it 'The password confirmation must be the same as the password' do
    @user.password = 'hakoniwa'
    @user.password_confirmation = "makoniwa"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  
end 
end 
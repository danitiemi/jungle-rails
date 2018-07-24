require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do
    let(:user) { User.create(
      name: 'Bart',
      email: 'bart@simpson.com',
      password: 'aycaramba',
      password_confirmation: 'aycaramba'
    )}

    let(:user2) { User.create!(
        name: 'Stormtrooper',
        email: 'star@wars.ca',
        password: 'darthvader',
        password_confirmation: 'darthvader'
      )}

    it 'is valid with all fields successfully saved' do
      expect(User.new).to be_valid
    end
    
    it 'is not valid without a name' do
      user.name = nil
      expect(user.errors.full_messages)
    end 

    it 'is not valid without an email' do
      user.email = nil
      expect(user.errors.full_messages)
    end

    it 'is not valid without a password' do
      user.password = nil
      expect(user.errors.full_messages)
    end

    it 'is not valid without a password confirmation' do
      user.password_confirmation = nil
      expect(user.errors.full_messages)
    end

    it 'is not valid if the password does not match the password confirmation' do
      # user.password_confirmation = 'not the password'
      expect(user.password).to eq(user.password_confirmation)
    end

    it 'is not valid if the email is not unique' do
      user.save
      user2.email = user.email.upcase
      expect(user.errors.full_messages)
    end  
    
    it 'should check password is longer than 6 characters' do
      user.password = 'mmm'
      user.password_confirmation = 'mmm'
      expect(user.errors.full_messages)
    end

    describe '.authenticate_with_credentials' do

      let(:user) { User.create(
        name: 'Harry',
        email: 'harry@hogwarts.com',
        password: 'alohomora',
        password_confirmation: 'alohomora'
      )} 
    
      it 'should log in a user who enters valid credentials' do
        user.save
        expect(User.authenticate_with_credentials('harry@hogwarts.com', 'alohomora')).to be_truthy
      end

      it 'should reject login for an incorrect password' do
        user.save
        expect(User.authenticate_with_credentials('harry@hogwarts.com', 'darth vader')).to be_falsey
      end
      
      it 'should login for case insensitive emails' do
        user.save
        expect(User.authenticate_with_credentials('Harry@hogwarts.co', 'alohomora')).to be_truthy
      end
      
      it 'should accept login for emails with leading spaces' do
        user.save
        expect(User.authenticate_with_credentials('  harry@hogwarts.com', 'alohomora')).to be_truthy
      end
    
    end 
  end
end

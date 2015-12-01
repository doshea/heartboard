# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  sex             :string           default("Not Set")
#  email           :string           not null
#  username        :string           not null
#  image           :string
#  password_digest :string
#  auth_token      :string
#  is_admin        :boolean          default(FALSE)
#  time_zone       :string           default("Pacific Time (US & Canada)")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

describe User do
  context 'validations' do
    # before {FactoryGirl.build(:user)}
    it {should have_secure_password}

    context 'of password' do
      context 'on create or update' do
        it {should validate_presence_of(:password).on(:create)}
        it {should validate_confirmation_of(:password).on(:create)}
        it {should validate_length_of(:password).on(:create).is_at_least(User::MIN_PASSWORD_LENGTH).is_at_most(User::MAX_PASSWORD_LENGTH)}
      end
    end
    context 'of email' do
      it {should validate_presence_of(:email)}
      it {should validate_uniqueness_of(:email)}
      it {should validate_length_of(:email).is_at_least(User::MIN_EMAIL_LENGTH).is_at_most(User::MAX_EMAIL_LENGTH)}
    end
    context 'of username' do
      it {should validate_presence_of(:username)}
      it {should validate_uniqueness_of(:username)}
      it {should validate_length_of(:username).is_at_least(User::MIN_USERNAME_LENGTH).is_at_most(User::MAX_USERNAME_LENGTH)}
    end
    context 'of first name' do
      it {should allow_value("", nil).for(:first_name)}
      it {should validate_length_of(:first_name).is_at_least(User::MIN_NAME_LENGTH).is_at_most(User::MAX_NAME_LENGTH)}
    end
    context 'of last name' do
      it {should allow_value("", nil).for(:last_name)}
      it {should validate_length_of(:last_name).is_at_least(User::MIN_NAME_LENGTH).is_at_most(User::MAX_NAME_LENGTH)}
    end
  end
end

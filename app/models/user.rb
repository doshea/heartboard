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

class User < ActiveRecord::Base
  has_secure_password

  mount_uploader :image, AccountPicUploader

  has_one :patient
  has_one :provider

  def name
    "#{first_name} #{last_name}"
  end
end

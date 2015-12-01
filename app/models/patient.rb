# == Schema Information
#
# Table name: patients
#
#  id               :integer          not null, primary key
#  dob              :date
#  gender           :string
#  race             :string
#  ethnicity        :string
#  language         :string
#  allergies        :hstore
#  username         :string
#  image            :string
#  email            :string
#  password_digest  :string
#  phone_number     :string
#  street_address   :string
#  street_address_2 :string
#  city             :string
#  state            :string
#  zip_code         :integer
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Patient < ActiveRecord::Base
  has_many :appointments
  belongs_to :user
  belongs_to :guardian, class_name: 'Patient'
  has_many :wards, class_name: 'Patient', foreign_key: 'guardian_id'
  serialize :allergies, ActiveRecord::Coders::NestedHstore
end

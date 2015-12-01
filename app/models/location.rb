# == Schema Information
#
# Table name: locations
#
#  id               :integer          not null, primary key
#  name             :string
#  image            :string
#  street_address   :string
#  street_address_2 :string
#  city             :string
#  state            :string
#  zip_code         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Location < ActiveRecord::Base
  has_many :departments
  has_many :providers, through: :departments
end

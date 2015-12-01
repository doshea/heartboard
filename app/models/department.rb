# == Schema Information
#
# Table name: departments
#
#  id           :integer          not null, primary key
#  name         :string
#  phone_number :string
#  location_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Department < ActiveRecord::Base
  belongs_to :location

  has_and_belongs_to_many :providers
end

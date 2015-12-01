# == Schema Information
#
# Table name: providers
#
#  id           :integer          not null, primary key
#  work_phone   :string
#  mobile_phone :string
#  pager        :string
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Provider < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :departments
  has_many :locations, through: :departments
end
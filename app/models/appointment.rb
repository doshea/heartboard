# == Schema Information
#
# Table name: appointments
#
#  id             :integer          not null, primary key
#  subject        :string
#  description    :text
#  scheduled_time :datetime
#  provider_id    :integer
#  patient_id     :integer
#  department_id  :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Appointment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :provider
  belongs_to :department

  scope :recent, -> { order(scheduled_time: :desc) }
end

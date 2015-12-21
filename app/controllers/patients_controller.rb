class PatientsController < ApplicationController
  def show
    @user = User.find_by_username('ellen') #TODO CHANGE THIS TO BE DYNAMIC
    @patient = @user.patient.decorate
    @appointments = @patient.appointments.recent
  end
end

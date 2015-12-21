class ProviderDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def work_phone
    if model.work_phone
      h.number_to_phone model.work_phone, area_code: true
    end
  end

  def name
    "Dr. #{model.user.first_name} #{model.user.last_name}"
  end

end
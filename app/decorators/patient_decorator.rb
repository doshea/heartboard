class PatientDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def dob
    if model.dob
      h.capture do
        h.concat(h.content_tag(:span, model.dob.strftime('%B %e, %Y'), id: 'dob'))
        h.concat(h.content_tag(:span, ' (DOB)', class: 'reminder'))
      end
    end
  end

  def religion

  end

  def guardian
    if model.guardian
      h.capture do
        h.concat(h.content_tag(:span, model.guardian.user.name, id: 'guardian'))
        h.concat(h.content_tag(:span, ' (GUARDIAN)', class: 'reminder'))
      end
    end
  end

  def phone_number
    if model.phone_number
      h.number_to_phone model.phone_number, area_code: true
    end
  end

  def address
    if model.street_address
      h.capture do
        h.concat(model.street_address)
        if model.street_address_2
          h.concat(h.tag(:br))
          h.concat(model.street_address_2)
        end
        if model.city
          h.concat(h.tag(:br))
          h.concat(model.city)
        end
        if model.state
          h.concat(", #{model.state}")
        end
        if model.zip_code
          h.concat(" #{model.zip_code}")
        end
      end
    end
  end



end

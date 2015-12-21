class PatientDecorator < Draper::Decorator
  delegate_all
  decorates_association :providers
  decorates_association :pcp

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

  # Holy cow, it's possible to wrap parentheses around a block!!!
  def allergy_list
    if model.allergies.any?
      h.capture do
        h.content_tag(:ul, class: 'list-unstyled') do
          model.allergies.each do |k, v|
            h.concat(h.content_tag(:li, class: 'row') do
              h.concat(h.content_tag(:div, k.titleize, class: 'col-sm-9 characteristic'))
              h.concat(h.content_tag(:div, class: 'col-sm-3 sev-dots') do
                (0...v['severity']).each do
                  h.concat(h.content_tag(:div, nil, class: 'severity-dot filled'))
                end
                (0...(5-v['severity'])).each do
                  h.concat(h.content_tag(:div, nil, class: 'severity-dot empty'))
                end
              end)
              h.concat(h.content_tag(:div, v['symptoms'], class: 'col-sm-6'))
              h.concat(h.content_tag(:div, severity_to_s(v['severity']), class: 'col-sm-6 sev-desc'))
            end)
          end
        end
      end
    else
      'No Known Allergies'
    end
  end

  def provider_list
    if model.providers.any?
      h.capture do
        h.content_tag(:ul, class: 'list-unstyled') do
          model.providers.each do |pro|
            h.concat(h.content_tag(:li, class: 'row') do
              h.concat(h.content_tag(:div, pro.name, class: 'col-sm-12 characteristic'))

            end)
          end
        end
      end
    end
  end

  private
  def severity_to_s(severity)
    if severity < 2
      'mild'
    elsif severity < 3
      'mild to moderate'
    elsif severity < 4
      'moderate'
    elsif severity < 5
      'moderate to severe'
    else
      'severe'
    end
  end

end

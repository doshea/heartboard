module ApplicationHelper
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

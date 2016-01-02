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

  def title(s, override=false)
    content_for(:title){override ? s : "#{s} | Nightingale"}
  end

  def title_backup
    if content_for? :title
      return nil
    else
      'Nightingale'
    end
  end
end

module ApplicationHelper

  def submit_or_cancel(form, name='cancel')
    form.submit + 
      content_tag(:span, " or ") + 
      link_to(name, 'javascript:history.back();', :class=> 'cancel')
  end
  
end

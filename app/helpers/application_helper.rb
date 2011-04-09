module ApplicationHelper

  def submit_or_cancel(form, name='Cancel')
    form.submit + " or " + 
      link_to(name, 'javascript:history.back();', :class=> 'cancel')
  end
  
end

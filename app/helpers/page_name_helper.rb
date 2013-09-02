module PageNameHelper

  def page_name
    t page_name_translation_key, page_name_context.merge(default: :"title.default")
  end

  def page_name_translation_key
    :"title.#{controller_name}.#{action_name}"
  end

  def page_name_context
    controller.view_assigns
  end
end

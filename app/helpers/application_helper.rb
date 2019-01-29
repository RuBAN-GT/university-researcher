module ApplicationHelper
  # Handle resource messages
  def error_resource_message(resource, field)
    if resource.errors[field.to_sym].any?
      output = resource.errors.full_messages_for(field.to_sym).join('. ')

      content_tag :div, output, :class => "ui basic negative pointing prompt label"
    end
  end

  # Get icon tag
  def icon(name, options = {})
    content_tag :i, nil, :class => "icon #{options[:class].to_s} #{name.to_s}"
  end

  # Get controller & action target script
  def target_scripts
    result = ''

    controller_path = "#{params[:controller]}"
    controller_path.insert (controller_path.rindex('/').to_i + 1), 'targets/'

    if File.exist? Rails.root.join('app', 'assets', 'javascripts', "#{controller_path}.js.coffee")
      result += javascript_include_tag("#{controller_path}", 'data-turbolinks-track': 'reload')
    end
    if File.exist? Rails.root.join('app', 'assets', 'javascripts', "#{controller_path}_#{params[:action]}.js.coffee")
      result += javascript_include_tag("#{controller_path}_#{params[:action]}", 'data-turbolinks-track': 'reload')
    end

    result.html_safe
  end

  # Get controller class for css name
  def controller_classes
    params[:controller].gsub('/', '_')
  end

  # Tag for modal windows
  def tag_parent_url(path)
    content_tag :span, nil, 'data-parent-url' => path
  end

  # Copyrights
  def researcher_copyright
    "#{I18n.t 'meta_tags.defaults.site'} v #{Researcher::Application::VERSION}".html_safe
  end
  def researcher_safe_copyright
    "<!-- Researcher created by Ruban Dmitry <dkruban@gmail.com> -->".html_safe
  end
end


class ActionView::Helpers::FormBuilder
  def has_error?(method)
    object.errors[method.to_sym].any?
  end
  def error_message(method, options = {})
    if has_error? method
      output = object.errors.full_messages_for(method.to_sym).join('. ')

      options = {
        :class => 'ui basic negative pointing prompt label'
      }.merge options

      @template.content_tag :div, output, :class => options[:class]
    end
  end
  def error_class(method)
    has_error?(method) ? 'error' : ''
  end
end

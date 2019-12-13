module ApplicationHelper

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'Github', "https://github.com/#{author}/#{repo}", target:'_blank'
  end

  def flash_message(type)
    {
      notice: 'alert-info',
      alert: 'alert-danger'
    }[type.to_sym]
    #content_tag :p, flash[type], class: "flash #{type}" if flash[type]
  end
end

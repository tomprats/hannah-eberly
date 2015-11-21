class PagesController < ApplicationController
  def home
    @path = Page.first.try(:path)
  end

  def show
    @page = Page.find_by(path: params[:path]) || not_found
    @paintings = @page.group.paintings if @page.group

    @html = Rails.cache.fetch(@page) do
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
      markdown.render(@page.text || "").html_safe
    end

    if ["contact"].include? @page.path
      render @page.path, layout: true
    end
  end
end

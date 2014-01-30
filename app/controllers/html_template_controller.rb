class HtmlTemplateController < ApplicationController

  def index
    @templates = HtmlTemplate.order(:created_at).page params[:page]
  end

  def new_template
    @template = HtmlTemplate.new
  end

  def image
    json_response = { files: [] }
    Image.transaction do
      json_response[:files] = Image.save_images(params[:files])
    end
    render json: json_response
  end

end

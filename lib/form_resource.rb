module FormResource

  def self.included(klass)
    klass.instance_eval do
      before_filter :load_form
    end
  end

  private

  def load_form
    @form = Form.find(params[:form_id]) rescue nil
    redirect_to forms_url, notice: 'The form does not exist.' unless @form
  end
end

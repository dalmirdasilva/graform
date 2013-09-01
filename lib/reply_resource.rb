module ReplyResource

  def self.included(klass)
    klass.instance_eval do
      before_filter :load_reply
    end
  end

  private

  def load_reply
    @reply = Reply.find(params[:reply_id]) rescue nil
    redirect_to form_replies_path(@form), notice: 'The reply does not exist.' unless @reply
  end
end

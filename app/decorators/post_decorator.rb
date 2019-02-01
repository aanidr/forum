class PostDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def delete_and_edit_links
    if logged_in? and current_user.id == object.user_id
      link_to 'delete', topic_post_path(post), method: :delete
      link_to 'edit', edit_topic_post_path(post)
    end
  end

  def user_name
    User.find_or_nil(object.user_id).name
  end
end

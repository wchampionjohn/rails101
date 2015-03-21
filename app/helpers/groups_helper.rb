module GroupsHelper
  def render_group_title(group)
    truncate(simple_format(group), :lenth => 17)
  end
end

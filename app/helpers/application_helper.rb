module ApplicationHelper

  # Provide a mechanism to render layout within a parent layout
  def render_parent_layout(layout = 'application')
    @view_flow.set(:layout,output_buffer)
    self.output_buffer = render(:file => "layouts/#{layout}")
  end
end

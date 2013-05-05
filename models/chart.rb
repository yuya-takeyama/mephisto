class Chart
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :chart_group_id, Integer, :unique_index => :chart_group_name_time, :required => true
  property :name, String, :unique_index => :chart_group_name_time, :required => true

  timestamps :at
  property :deleted_at, ParanoidDateTime, :unique_index => :chart_group_name_time

  def css_id
    "chart_#{id}"
  end

  def morris_chart
    @morris_chart ||= ::MorrisChart.new(
      chart: self,
      stats: Stat.all(chart_id: id, order: 'label'),
      element: css_id,
    )
  end

  def render_morris_chart
    if morris_chart.empty?
      '<div class="alert">No stats are available!</div>'
    else
      "<div id=\"#{css_id}\"></div>\n" +
      "<script>Morris.Bar(#{morris_chart.to_json})</script>"
    end
  end
end

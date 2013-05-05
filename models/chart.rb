class Chart
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :chart_group_id, Integer, :unique_index => :chart_group_name_time, :required => true
  property :name, String, :unique_index => :chart_group_name_time, :required => true

  timestamps :at
  property :deleted_at, ParanoidDateTime, :unique_index => :chart_group_name_time
end

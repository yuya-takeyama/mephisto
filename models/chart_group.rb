class ChartGroup
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String, :unique_index => :service_section_name_time, :required => true
  property :service_name, String, :unique_index => :service_section_name_time, :required => true
  property :section_name, String, :unique_index => :service_section_name_time, :required => true

  timestamps :at
  property :deleted_at, ParanoidDateTime, :unique_index => :service_section_name_time
end

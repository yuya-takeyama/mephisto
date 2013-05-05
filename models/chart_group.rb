class ChartGroup
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :name, String, :unique_index => :service_section_name_time, :required => true
  property :service_name, String, :unique_index => :service_section_name_time, :required => true
  property :section_name, String, :unique_index => :service_section_name_time, :required => true

  timestamps :at
  property :deleted_at, ParanoidDateTime, :unique_index => :service_section_name_time

  def self.services
    self.all(
      fields: ['service_name'],
      unique: true,
      order: 'service_name'
    ).map{|c| c.service_name }
  end

  def self.sections(conditions = {})
    conditions = {
      fields: ['service_name', 'section_name'],
      unique: true,
      order: 'section_name'
    }.merge(conditions)


    self.all(conditions).map {|c| c.section_name }
  end
end

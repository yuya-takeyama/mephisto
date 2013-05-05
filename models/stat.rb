class Stat
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :chart_id, Integer, :unique_index => :chart_label_time, :required => true
  property :label, String, :unique_index => :chart_label_time, :required => true
  property :value, Float, :required => true

  timestamps :at
  property :deleted_at, ParanoidDateTime, :unique_index => :chart_label_time
end

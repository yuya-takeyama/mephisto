require 'json'

class MorrisChart
  def initialize(params = {})
    @chart = params[:chart]
    @stats = params[:stats]
    @element = params[:element]
  end

  def empty?
    @empty ||= @stats.empty?
  end

  def to_hash
    @hash ||= {
      element: @element,
      data: @stats.map{|s| {label:s.label, v: s.value} },
      xkey: 'label',
      ykeys: ['v'],
      labels: @stats.map{|s| s.label },
    }
  end

  def to_json
    @json ||= to_hash.to_json
  end
end

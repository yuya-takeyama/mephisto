Mephisto::App.controllers :api, :v0 do
  set :protect_from_csrf, false

  post :charts, :with => [:service_name, :section_name, :chart_group_name, :chart_name] do
    content_type :json

    filtered_params = params.dup

    chart_group = ChartGroup.first_or_new(
      service_name: filtered_params[:service_name],
      section_name: filtered_params[:section_name],
      name: filtered_params[:chart_group_name],
    )

    unless chart_group.saved?
      unless chart_group.save
        status 500

        return {
          message: 'Failed to save ChartGroup',
          errors: chart_group.errors.full_messages
        }.to_json
      end
    end

    chart = Chart.first_or_new(
      chart_group_id: chart_group.id,
      name: filtered_params[:chart_name],
    )

    unless chart.saved?
      unless chart.save
        status 500

        return {
          message: 'Failed to save Chart',
          errors: chart.errors.full_messages
        }.to_json
      end
    end

    stat = Stat.first_or_new(
      chart_id: chart.id,
      label: filtered_params['label'],
    )

    stat.value = filtered_params['value']

    if stat.save
      status 200
      {
        message: 'Saved successfully',
      }.to_json
    else
      status 500
      {
        message: 'Failed to save stat',
        errors: stat.errors.full_messages
      }.to_json
    end
  end
end

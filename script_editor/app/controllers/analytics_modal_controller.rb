class AnalyticsModalController < ApplicationController
  def show
    l = Line.new
    @hash = l.countAnalytics(cookies[:play_id])
    @speakers = l.getAllSpeakers.keys
    @matrixData = l.charFeatureWrapper
    @speakersPretty = @speakers.collect { |x| x.capitalize }
    render :layout => false
  end
end

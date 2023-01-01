class FedisController < ApplicationController
  def index
    $fedis = Fedis.new if $fedis.nil?
  end

  def add
    $fedis.set(params[:key], params[:value])
  end

  def remove
    $fedis.remove(params[:key])
  end
end

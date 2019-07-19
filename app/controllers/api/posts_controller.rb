class Api::PostsController < ApplicationController

  require 'rest-client'
  require_relative '../../assets/resources/resources'

  def query

    tags = params[:tags].split(',')
    sortBy = params[:sortBy]
    direction = params[:direction]
    threads = []
    responses = []
    mergedresponses = {"posts" => []}
    fields = ['id', 'likes', 'popularity', 'reads']

    if (tags.length === 0) 
      render :json => {:error => "Tags parameter is required"}.to_json, :status => 400

    elsif (!sortBy.nil? && !fields.include?(sortBy))
      render :json => {:error => "sortBy parameter is invalid"}.to_json, :status => 400

    elsif (sortBy.nil? && !direction.nil?)
      render :json => {:error => "sortBy parameter is invalid"}.to_json, :status => 400

    elsif (!direction.nil? && direction!= 'asc' && direction!= 'desc')
      render :json => {:error => "sortBy parameter is invalid"}.to_json, :status => 400

    else

      tags.each_with_index do |t, index|
        threads << Thread.new {responses[index] = JSON.parse RestClient.get(Resources.data + "#{t}")}
      end

      threads.each(&:join)
      
      responses.each do |res|
        mergedresponses["posts"] |= res["posts"]
      end

      if(sortBy)
        if (direction === 'desc')
          mergedresponses["posts"].sort_by! { 
            |post| -post[sortBy] 
          }
        else
          mergedresponses["posts"].sort_by! { 
            |post| post[sortBy] 
          }
        end
      end        

      render :json => mergedresponses, :status => 200

    end


  end

end

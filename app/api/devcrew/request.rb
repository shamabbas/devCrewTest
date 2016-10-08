require 'rack/cors'
require 'grape-swagger'
module Devcrew
  class Request < Grape::API
    version 'v1', using: :path
    format :json
    rescue_from :all

    error_formatter :json, lambda { |message, backtrace, options, env|
                           {
                               status: 'failed',
                               message: message,
                               error_code: 500
                           }.to_json

                         }

    before do
      header['Access-Control-Allow-Origin'] = '*'
      header['Access-Control-Request-Method'] = '*'
    end

    # Monster CRUD operations API

    # Get All Monsters
    resource :monsters do
      get '/' do
        Monster.all
      end
    end

    # Get Monster by ID
    resource :monster do
      params do
        requires :id, type: Integer
      end
      get ':id' do
        Monster.find(params[:id])
      end
    end

    # Create Monster with required params
    resource :create_monster do
      params do
        requires :name, type: String
        requires :team_id, type: Integer
        requires :user_id, type: Integer
      end
      post '/' do
        monster = Monster.new(name: params[:name], team_id: params[:team_id],power: params[:power],
            monster_type: params[:monster_type],user_id: params[:user_id])
        if monster.save!
          {
              status: 'success',
              message: 'Monster is created successfully!'
          }.to_json
        else
          {
              status: 'error',
              message: 'A problem occurred. Please try again later!'
          }.to_json
        end
      end
    end

    # Delete Monster by ID
    resource :delete_monster do
      params do
        requires :id, type: Integer
      end
      delete ':id' do
        monster= Monster.find(params[:id])
        if monster.destroy
          {
              status: 'success',
              message: 'Successfully deleted!'
          }.to_json
        else
          {
              status: 'error',
              message: 'A problem occurred. Please try again later!'
          }.to_json
        end
      end
    end


    # Team CRUD operations API

    # Get All Teams
    resource :teams do
      get '/' do
        Team.all
      end
    end

    # Get Monster by ID
    resource :team do
      params do
        requires :id, type: Integer
      end
      get ':id' do
        Team.find(params[:id])
      end
    end

    # Create Team with required params
    resource :create_team do
      params do
        requires :name, type: String
        requires :user_id, type: Integer
      end
      post '/' do
        team = Team.new(name: params[:name], user_id: params[:user_id])
        if team.save
          {
              status: 'success',
              message: 'Team is created successfully!'
          }.to_json
        else
          {
              status: 'error',
              message: 'A problem occurred. Please try again later!'
          }.to_json
        end
      end
    end

    # Delete Team by ID
    resource :delete_team do
      params do
        requires :id, type: Integer
      end
      delete ':id' do
        team = Team.find(params[:id])
        if team.destroy
          {
              status: 'success',
              message: 'Successfully deleted!'
          }.to_json
        else
          {
              status: 'error',
              message: 'A problem occurred. Please try again later!'
          }.to_json
        end
      end
    end
  end
end
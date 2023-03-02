class EntriesController < ApplicationController
    # Routings
        get "/entries" do
            entries = Entry.all
            entries.to_json
        end
    
         # add entry
         post "/entries" do
            title = params[:title]
            user = params[:user]
            location = params[:location]
            description = params[:description]
    
            if(title.present? && user.present? && location.present? && description.present?)
                entry = Entry.create(title: title, user_id: user,location: location,description: description)
                if entry
                    message = {:succcess => "Entry created successfully!!"}
                    message.to_json
                else
                    message = {:error => "Error saving entry!"}
                    message.to_json
                end
            else
                message = {:error => "All fields should be filled!"}
                message.to_json
            end
        end
    
        # delete entry
        delete "/entries/:id" do
            count_entries = Entry.where(id: params[:id]).count() #Integer 2,3,4,5
            if count_entries>0
                entry = Entry.find(params[:id])
                entry.destroy
                message = {:succcess => "Entry deleted successfully!!"}
                message.to_json
    
            else
                message = {:error => "Entry does not exist!"}
                message.to_json
            end
        end
    
    end
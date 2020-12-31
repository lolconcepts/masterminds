module Admin
  class EntriesController < Admin::ApplicationController
    # Overwrite any of the RESTful controller actions to implement custom behavior
    # For example, you may want to send an email after a foo is updated.
    #
    def update
        @entry = Entry.find(params[:id])
        @user = @entry.user
        respond_to do |format|
            if @entry.update(entry_params)
                if @entry.accepted
                    @user.hours += @entry.timespent.to_d
                    @user.save
                end
                format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
                format.json { render :show, status: :ok, location: @entry }
            else
                format.html { render :edit }
                format.json { render json: @entry.errors, status: :unprocessable_entity }
            end
        end
    end

    # Override this method to specify custom lookup behavior.
    # This will be used to set the resource for the `show`, `edit`, and `update`
    # actions.
    #
    # def find_resource(param)
    #   Foo.find_by!(slug: param)
    # end

    # The result of this lookup will be available as `requested_resource`

    # Override this if you have certain roles that require a subset
    # this will be used to set the records shown on the `index` action.
    #
    # def scoped_resource
    #   if current_user.super_admin?
    #     resource_class
    #   else
    #     resource_class.with_less_stuff
    #   end
    # end

    # Override `resource_params` if you want to transform the submitted
    # data before it's persisted. For example, the following would turn all
    # empty values into nil values. It uses other APIs such as `resource_class`
    # and `dashboard`:
    #
     def resource_params
       params.require(resource_class.model_name.param_key).
         permit(dashboard.permitted_attributes).
         transform_values { |value| value == "" ? nil : value }
     end
     def entry_params
      params.require(:entry).permit(:user_id, :reason_id, :timespent, :recording, :notes, :evidence, :session_date, :reviewed, :accepted)
    end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end

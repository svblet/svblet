module PlacesHelper
    def errors_for(model, attribute)
        if model.errors[attribute].present?
            error = "<div class=\"alert alert-danger\">
          <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>
          #{content_tag :div, model.errors.full_messages_for(attribute).join(", ")}
        </div>"
            error.html_safe
        end
    end
end

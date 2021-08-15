class Api::V1::LinksController < ApplicationController
  def index
    links = Link.hottest_first
    #in the rendered json, skip the timestamp attrs mentioned via the  except key-value pair because they are a PITA when validating in specs
    #Always remember to use paranthesis around method calls when the first argument is a literal hash with braces, otherwise Ruby thinks its a block and throws errors
    #Go figure.
    render(
      {
        json: links,
        except: [:created_at, :updated_at]
      }
    )
  end

  def create
    link = Link.new(params.require(:link).permit(:title, :url))

    if link.save
      #you need to explicitly set the status to "created" to return a 201 code
      render(
        { json: link,
          except: [:created_at, :updated_at],
          status: :created
        }
      )
    else
      #setting the status to "unprocessable entity" returns a 422 code
      #after parsing, json response body looks like this:
      #{"errors"=>["Url can't be blank"]}
      render(
        {
          json: { errors: link.errors.full_messages },
          status: :unprocessable_entity
        }
      )
    end
  end
end

@company && (
  if @company.destroy
    json.status 200
    json.message "Company Deleted Successfully"
  else
    json.status 422
    json.errors @company.errors.full_messages
  end
) || (
  json.status 404
  json.message "Company Not Found"
)

json.array!(@emailinfos) do |emailinfo|
  json.extract! emailinfo, :id, :email_id
  json.url emailinfo_url(emailinfo, format: :json)
end

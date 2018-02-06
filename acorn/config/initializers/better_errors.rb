# Borrowed from
# https://github.com/charliesome/better_errors/wiki#better-errors-with-vagrant

# Allows usage on Docker
if defined?(BetterErrors)
  if [:development, :test].member?(Rails.env.to_sym)
    BetterErrors::Middleware.allow_ip! '0.0.0.0/0'
  end
end

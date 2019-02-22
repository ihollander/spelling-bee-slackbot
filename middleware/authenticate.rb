# Custom Rack middleware to authenticate Slack signature
# https://api.slack.com/docs/verifying-requests-from-slack
class Authenticate

  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)

    version = "v0"
    request_body = request.body.read
    timestamp = request.env["HTTP_X_SLACK_REQUEST_TIMESTAMP"]
    
    # check that the timestamp is recent (~5 mins) to prevent replay attacks
    if Time.at(timestamp.to_i) < Time.now - (60 * 5)
      Rack::Response.new([], 401, {}).finish
      return
    end
    
    # generate hash
    computed_signature = generate_hash(version, timestamp, request_body)

    slack_signature = request.env["HTTP_X_SLACK_SIGNATURE"]

    if computed_signature == slack_signature
      @app.call(env)
    else
      Rack::Response.new([], 401, {}).finish
    end
  end

  def generate_hash(version, timestamp, request_body)
    sig_basestring = "#{version}:#{timestamp}:#{request_body}"
    slack_secret = ENV["SLACK_SECRET"]
    digest = OpenSSL::Digest::SHA256.new
    hex_hash = OpenSSL::HMAC.hexdigest(digest, slack_secret, sig_basestring)
    
    "#{version}=#{hex_hash}"
  end

end
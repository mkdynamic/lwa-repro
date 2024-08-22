app = Proc.new do |_env|
  [
    200,
    {"content-type" => "text/plain", "content-lenth" => "2"},
    ["hi"]
  ]
end

run app

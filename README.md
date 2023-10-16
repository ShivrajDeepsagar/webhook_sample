# README
Steps to run the app:

Git clone: git@github.com:ShivrajDeepsagar/webhook_sample.git

cd webhook_sample

run bundle install

run rake db:migrate

run the rails app by doing rails s

To test the webook post request open postman and paste

http://localhost:3000/webhooks  it would be a POST request

sample payload


{
  "webhook": {
    "url": "https://example.com/webhook-endpoint",
    "payload": {
      "key1": "value1",
      "key2": "value2"
    }
  }
}

Thirdparty api : POSTMAN ECHO

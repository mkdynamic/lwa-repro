FROM ruby:3.3.3-alpine
COPY --from=public.ecr.aws/awsguru/aws-lambda-adapter:0.8.4 /lambda-adapter /opt/extensions/lambda-adapter
ENV RUST_LOG="debug"
WORKDIR /app
COPY . .
RUN gem install bundler
RUN bundle install
CMD ["bundle", "exec", "rackup", "--port", "8080", "config.ru"]

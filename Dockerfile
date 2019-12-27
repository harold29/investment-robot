FROM ruby:2.7
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /investment-robot
WORKDIR /investment-robot
COPY Gemfile /investment-robot/Gemfile
COPY Gemfile.lock /investment-robot/Gemfile.lock
RUN bundle install
COPY . /investment-robot

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


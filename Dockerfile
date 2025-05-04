# Use the official Ruby image as the base image
FROM ruby:3.4.1

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  yarn

# Set the working directory in the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install the Gems
RUN bundle install

# Copy the rest of the application code into the container
COPY . .

# Precompile assets (optional)
RUN RAILS_ENV=development bundle exec rake assets:precompile

# Expose the port that the Rails server will run on
EXPOSE 3000

# Set the command to start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
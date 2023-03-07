# Dockerfile development version
FROM ruby:3.1.2-alpine

# Install OS development dependencies
RUN apk add \
build-base \
postgresql-dev \
tzdata \
vips-dev

# Set the working directory to the app folder
WORKDIR /app

# Copy the Gemfile to the container and install the Rails project dependencies
COPY Gemfile* ./
RUN bundle install

# Copy the project code from the host machine to the container's working directory (/app)
COPY . .

# Expose port 3000 on the container for accessing the server on the host machine
EXPOSE 3000

# Start the Rails development server
CMD ["sh", "-c", "rm -f tmp/pids/server.pid && bin/rails server -b 0.0.0.0 && bin/rails tailwindcss:watch"]
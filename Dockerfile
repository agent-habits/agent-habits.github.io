# Lightweight development image for this Jekyll site.
# Build once, then run with a volume mount: docker run -v $(pwd):/srv/jekyll ...

FROM ruby:3.1-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    curl \
    ca-certificates \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /srv/jekyll

# Copy only Gemfile and Gemfile.lock first to leverage Docker layer caching
COPY docs/Gemfile Gemfile.lock* ./

# Install bundler and gems into image (use system gems for simplicity)
RUN gem install bundler -v "~>2.3" \
    && bundle config set --local without 'development test' || true \
    && bundle install --jobs 4 --retry 3

# Default workdir for when running with a mount
WORKDIR /srv/jekyll

EXPOSE 4000

# Default command; when using a bind mount, bundle install will be skipped
CMD ["bundle", "exec", "jekyll", "serve", "--livereload", "--host", "0.0.0.0", "--port", "4000"]

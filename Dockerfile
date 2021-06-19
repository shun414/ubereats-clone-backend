FROM ruby:2.7
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y nodejs yarn \
  && mkdir /UberEats-clone-backend
WORKDIR /UberEats-clone-backend
COPY Gemfile /UberEats-clone-backend/Gemfile
COPY Gemfile.lock /UberEats-clone-backend/Gemfile.lock
RUN bundle install
COPY . /UberEats-clone-backend

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

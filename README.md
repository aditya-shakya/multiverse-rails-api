# multiverse-rails-api
- install ruby version 2.6.3
- install gem rails version 4.2.11.1
- clone project and cd into dir
- run 'bundle install'
- db setup
  - rake db:drop db:create db:migrate db:seed
- to run server 'rails s'


# API specs

- get families api
    - GET '/universe/:id/families'
- get unbalanced families
    - GET '/unbalanced_families'
- balance a family
    - POST '/family/balance'
    - params => {"id" : 1}

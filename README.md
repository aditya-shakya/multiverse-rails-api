# multiverse-rails-api
- install ruby version 2.6.3
- install gem rails version 4.2.11.1
- clone project and cd into dir
- run 'bundle install'
- db setup
  - rake db:drop db:create db:migrate db:seed
- to run server 'rails s'


# API specs
- get all people and there family, univers
  - GET 'people/index'
- get families api
    - GET '/universe/:id/families'
- get unbalanced families
    - GET '/unbalanced_families'
- balance a family
    - POST '/family/balance'
    - params => {"id" : family_id}
    
    
# see this PR for main changes
  - https://github.com/aditya-shakya/multiverse-rails-api/pull/1

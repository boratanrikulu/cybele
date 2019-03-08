# Dummy_app

# TODOs
- Change email sender domain address and basic_auth info in `config/settings.yml`
- Change email sender domain address in `config/initializers/devise.rb`
- Create `.pronto.yml` file from `example.pronto.yml` file
- Run command for create environments ➜ ✗  `rails g environment`

# Infos
- Edit secret keys
➜ ✗ EDITOR=vi bin/rails credentials:edit


# Local development

- run following commands on terminal
➜ ✗ bundle exec rails server
- open in your browser localhost:3000 or lvh.me:3000

# Development
➜ ✗ pronto run
➜ ✗ pronto run -r haml
- On feature branch
➜ ✗ pronto run -c origin/develop
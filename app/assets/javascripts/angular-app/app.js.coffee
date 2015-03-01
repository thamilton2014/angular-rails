@app = angular.module('app', [
  # additinal dependencies here, such as restangular
  'templates'
])

# for compatibility with rails CSRF protection

@app.config([
  '$httpProvider', ($httpProvider)->
    $httpProvider.defaults.headers.common['X-CSRF-TOKEN'] = $('meta[name=csrf-token').attr('content')
])

@app.run(->
  console.log 'angular app running'
)
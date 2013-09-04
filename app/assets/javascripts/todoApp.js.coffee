todoApp = angular.module('todoApp', ['ngResource', 'mk.editablespan', 'ui.sortable'])

todoApp.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

todoApp.config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode true
  $routeProvider.when '/dashboard', templateUrl: '/dashboard.html'      
  $routeProvider.when '/task_lists/:list_id', templateUrl: '/task_list.html'      

# Makes AngularJS work with turbolinks.
$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])

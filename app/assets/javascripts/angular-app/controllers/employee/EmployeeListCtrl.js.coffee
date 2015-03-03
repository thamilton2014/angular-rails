angular.module('app.employeeApp').controller("EmployeeListCtrl", [
  '$scope', 'Restangular','EmployeeService', '$modal',
  ($scope, Restangular, EmployeeService, $modal)->

    $scope.editEmployee = (employee) ->
      $modal.open({
        templateUrl: 'employee/edit.html',
        controller: 'EmployeeEditModalCtrl'
        size: 'lg'
        resolve:
          employee: ->
            employee
      })

    $scope.showEmployee = (employee) ->
      $modal.open({
        templateUrl: 'employee/show.html',
        controller: 'EmployeeShowModalCtrl'
        size: 'md'
        resolve:
          employee: ->
            employee
      })

    $scope.newEmployee = (employee) ->
      $modal.open({
        templateUrl: 'employee/new.html',
        controller: 'EmployeeNewModalCtrl'
        size: 'md'
        resolve:
          employee: ->
            employee
      })

    $scope.deleteEmployee = (employee) ->
      employee.remove()
      $scope.employees = _.without($scope.employees, employee)

    EmployeeService.list().then((employees) ->
      $scope.employees = employees
    )
])

angular.module('app.employeeApp').controller('EmployeeShowModalCtrl', [
  '$scope', '$modalInstance', 'employee', ($scope, $modalInstance, employee)->
    $scope.employee = employee

    $scope.cancel = ->
      $modalInstance.close('cancel')
])

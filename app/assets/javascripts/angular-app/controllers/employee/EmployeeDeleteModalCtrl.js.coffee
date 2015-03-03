angular.module('app.employeeApp').controller('EmployeeDeleteModalCtrl', [
  '$scope', 'Restangular', 'employee' ,'$modalInstance', ($scope, Restangular, employee, $modalInstance)->
    $scope.employee = employee

    $scope.deleteEmployee = (employee)->
      console.log "method!"
      Restangular.remove().then(
        $modalInstance.close('saved')
      )

    $scope.cancel = ->
      $modalInstance.dismiss('cancel')

])
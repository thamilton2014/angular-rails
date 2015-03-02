angular.module('app.employeeApp').controller('EmployeeNewModalCtrl', [
  '$scope', 'Restangular', 'employee' ,'$modalInstance', ($scope, Restangular, employee, $modalInstance)->
    $scope.employee = employee

    $scope.submitEmployee = (employee)->
      Restangular.all("employees").post({employee: employee}).then(
        $modalInstance.close('saved')
      )

    $scope.cancel = ->
      $modalInstance.dismiss('cancel')

])
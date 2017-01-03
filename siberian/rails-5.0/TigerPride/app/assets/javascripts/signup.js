(function() {
    var app = angular.module('signupApp', []);
    app.controller('signupController', function($scope, $http) {
        $scope.formData = {
            name: 'asdfasd',
            email: 'axe',
            authenticity_token: $('#authenticity_token').val()
        };
        $scope.auxillary = {
            email: 'axe',
            password: 'alphabeta',
            confirm_password: 'alphabeta'
        };
        $scope.error = {};
        $scope.nameExists = function() {
            $('#name').addClass('loader-7');
            $http({
                    method: 'POST',
                    url: '/access/name_exists.json',
                    data: $.param({
                        'name': $scope.formData.name,
                        authenticity_token: $('#authenticity_token').val()
                    }),
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    }
                })
                .success(function(data) {
                    console.log(data);

                    if (data.exists) {
                        $scope.error.name = 'That username is not available';
                        $scope.signupForm.name.$setValidity('nameExists', false)
                    }
                    else {
                        $scope.signupForm.name.$setValidity('nameExists', true)
                    }
                }).then(function() {
                    $('#name').removeClass('loader-7');
                });
        }
        $scope.emailExists = function() {
            $('#email').addClass('loader-7');
            $http({
                    method: 'POST',
                    url: '/access/email_exists.json',
                    data: $.param({
                        'email': $scope.formData.email,
                        authenticity_token: $('#authenticity_token').val()
                    }),
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    }
                })
                .success(function(data) {
                    console.log(data);

                    if (data.exists) {
                        $scope.error.email = 'That username is not available';
                        $scope.signupForm.email.$setValidity('emailExists', false)
                    }
                    else {
                        $scope.signupForm.email.$setValidity('emailExists', true)
                    }
                }).then(function() {
                    $('#email').removeClass('loader-7');
                });
        }
        $scope.confirmEmail = function() {
            var valid = $scope.formData.email === $scope.auxillary.email;
            $scope.signupForm.email.$setValidity('confirmEmail', valid);
            $scope.signupForm.confirm_email.$setValidity('confirmEmail', valid);
        }
        $scope.confirmPassword = function() {
            var valid = $scope.auxillary.password === $scope.auxillary.confirm_password;
            $scope.signupForm.password.$setValidity('confirmPassword', valid);
            $scope.signupForm.confirm_password.$setValidity('confirmPassword', valid);
        }
        $scope.validEmail = function() {
            $scope.signupForm.email.$setValidity('confirmEmail', true);
            $scope.signupForm.confirm_email.$setValidity('confirmEmail', true);
        }
        $scope.validPassword = function() {
            $scope.signupForm.password.$setValidity('confirmPassword', true);
            $scope.signupForm.confirm_password.$setValidity('confirmPassword', true);
        }
        $scope.processForm = function() {
            //console.log('processForm');
            ///*
            //console.log($('#authenticity_token').val());
            $http({
                    method: 'POST',
                    url: '/access/register',
                    data: $.param($scope.formData), // pass in data as strings
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    } // set the headers so angular passing info as form data (not request payload)
                })
                .success(function(data) {
                    console.log(data);

                    $scope.message = data;
                });
            //*/
        };
    });
})()

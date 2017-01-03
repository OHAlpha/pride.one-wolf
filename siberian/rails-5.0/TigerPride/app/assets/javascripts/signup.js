function toHex(s) {
    var hex = "";
    for (var i = 0; i < s.length; i++) {
        hex += s.charCodeAt(i).toString(16);
    }
    return hex;
}

(function() {
    var app = angular.module('signupApp', []);
    app.controller('signupController', function($scope, $http) {
        $scope.formData = {
            authenticity_token: $('#authenticity_token').val()
        };
        $scope.auxillary = {};
        $scope.error = {};
        $scope.nameExists = function() {
            $('#name-field').addClass('loader-07');
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
                    $('#name-field').removeClass('loader-07');
                });
        }
        $scope.emailExists = function() {
            $('#email-field').addClass('loader-07');
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
                    $('#email-field').removeClass('loader-07');
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
            var password = $scope.auxillary.password;
            $scope.auxillary.password = '';
            $scope.auxillary.confirm_password = '';
            $('#submit-field').addClass('loader-07');
            $http({
                method: 'POST',
                url: '/access/generate_salt.json',
                data: {
                    name: $scope.formData.name,
                    email: $scope.formData.email,
                    authenticity_token: $('#authenticity_token').val()
                }
            }).success(function(data) {
                console.log(data);
                if (data.success) {
                    var md = forge.md.sha512.create();
                    var arr = forge.pkcs5.pbkdf2(password, data.salt, data.iterations, data.key_size, md);
                    var hex = toHex(arr);
                    $http({
                            method: 'POST',
                            url: '/access/register.json',
                            data: $.param({
                                name: $scope.formData.name,
                                email: $scope.formData.email,
                                salt: data.salt,
                                iterations: data.iterations,
                                passhash: hex,
                                authenticity_token: $('#authenticity_token').val()
                            }), // pass in data as strings
                            headers: {
                                'Content-Type': 'application/x-www-form-urlencoded'
                            } // set the headers so angular passing info as form data (not request payload)
                        })
                        .success(function(data) {
                            console.log(data);

                            $scope.message = data;
                        });
                }
            }).then(function() {
                $('#submit-field').removeClass('loader-07');
            });
        };
    });
})()
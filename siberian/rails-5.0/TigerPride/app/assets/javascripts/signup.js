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
        $scope.user = $('#url').val();
        $scope.user = {
            id: $('#user').val(),
            name: $('#name').attr('server-value'),
            email: $('#email').attr('server-value')
        };
        $scope.formData = {
            authenticity_token: $('#authenticity_token').val()
        };
        $scope.auxillary = {};
        $scope.error = {};
        $scope.log = function(text) {
            <% if Rails.env.development? %>
                if( $('#debug-console') )
                    $('#debug-console').append('<p>'+text+'</p>')
                else
                    console.log(text);
            <% end %>
        }
        $scope.nameExists = function() {
            $('#name-field').addClass('loader-07');
            $http({
                    method: 'POST',
                    url: '/access/name_exists',
                    data: $.param({
                        user: $scope.user.id,
                        name: $scope.user.name,
                        authenticity_token: $scope.formData.authenticity_token
                    }),
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    }
                })
                .success(function(response) {
                    $scope.log(response);

                    if (response == 'invalid') {
                        $scope.error.name = 'That username is not available';
                        $scope.signupForm.name.$setValidity('nameExists', false);
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
                    url: '/access/email_exists',
                    data: $.param({
                        user: $scope.user.id,
                        email: $scope.user.email,
                        authenticity_token: $scope.formData.authenticity_token
                    }),
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    }
                })
                .success(function(response) {
                    $scope.log(response);

                    if (response == 'invalid') {
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
            var valid = $scope.user.email === $scope.auxillary.email;
            if( !valid )
                $scope.error.confirm_email = 'email does not match';
            $scope.signupForm.email.$setValidity('confirmEmail', valid);
            $scope.signupForm.confirm_email.$setValidity('confirmEmail', valid);
        }
        $scope.confirmPassword = function() {
            var valid = $scope.auxillary.password === $scope.auxillary.confirm_password;
            if( !valid )
                $scope.error.confirm_password = 'password does not match';
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
        $scope.hashPassword = function(data) {
            var md = forge.md.sha512.create();
            var arr = forge.pkcs5.pbkdf2($scope.auxillary.password, data.salt, data.iterations, data.key_size, md);
            return toHex(arr);
        }
        $scope.handleSalt = function(data) {
            $scope.log(data);
            if (data.success) {
                var hex = $scope.hashPassword(data);
                $http({
                        method: 'POST',
                        url: '/access/register.json',
                        data: $.param({
                            user: $scope.user.id,
                            passhash: hex,
                            authenticity_token: $scope.formData.authenticity_token
                        }), // pass in data as strings
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded'
                        } // set the headers so angular passing info as form data (not request payload)
                    })
                    .success(function(data) {
                        $scope.log(data);
                        
                        $scope.message = data;
                        
                        window.location.href = $scope.url;
                    });
            }
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
                    user: $scope.user.id,
                    authenticity_token: $scope.formData.authenticity_token
                }
            }).success($scope.hashPassword).then(function() {
                $('#submit-field').removeClass('loader-07');
            });
        };
    });
})()
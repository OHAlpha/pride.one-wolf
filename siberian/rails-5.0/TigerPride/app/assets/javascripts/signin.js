function toHex(s) {
    var hex = "";
    for (var i = 0; i < s.length; i++) {
        hex += s.charCodeAt(i).toString(16);
    }
    return hex;
}

(function() {
    var app = angular.module('signinApp', []);
    app.controller('signinController', function($scope, $http) {
        $scope.user = {};
        $scope.formData = {
            authenticity_token: $('#authenticity_token').val()
        };
        $scope.mode = 'id';
        $scope.extended = false;
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
        $scope.processForm = function() {
            var password = $scope.auxillary.password;
            $scope.auxillary.password = '';
            $scope.auxillary.confirm_password = '';
            $('#submit-field').addClass('loader-07');
            $http($scope.mode == 'id' ? {
                method: 'POST',
                url: '/access/client_salt.json',
                data: {
                    identifier: $scope.user.identifier,
                    user: $scope.user.name,
                    email: $scope.user.email,
                    authenticity_token: $scope.formData.authenticity_token
                }
            } : {
                method: 'POST',
                url: '/access/login.json',
                data: {
                    identifier: $scope.formData.identifier,
                    authenticity_token: $('#authenticity_token').val()
                }
            }).success(function(data) {
                $scope.log(data);
                if (data.success) {
                    var md = forge.md.sha512.create();
                    var arr = forge.pkcs5.pbkdf2(password, data.salt, data.iterations, data.key_size, md);
                    var hex = toHex(arr);
                    $http({
                            method: 'POST',
                            url: '/access/login.json',
                            data: $.param({
                                user_id: data.user_id,
                                passhash: hex,
                                authenticity_token: $('#authenticity_token').val()
                            }), // pass in data as strings
                            headers: {
                                'Content-Type': 'application/x-www-form-urlencoded'
                            } // set the headers so angular passing info as form data (not request payload)
                        })
                        .success(function(data) {
                            $scope.log(data);

                            $scope.message = data;
                        });
                }
            }).then(function() {
                $('#submit-field').removeClass('loader-07');
            });
        };
    });
})()
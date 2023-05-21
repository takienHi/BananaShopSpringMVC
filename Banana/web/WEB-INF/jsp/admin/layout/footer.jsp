<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#imagePreview').css('background-image', 'url(' + e.target.result + ')');
                $('#imagePreview').hide();
                $('#imagePreview').fadeIn(650);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    $("#imageUpload").change(function () {
        readURL(this);
    });
</script>
<script>
    $.validator.addMethod("phoneVN", function (value, element) {
        return this.optional(element) || /(0)(3|5|7|8|9)+([0-9]{8})\b/.test(value);
    }, "Không đúng định dạng sđt Việt Nam");

    $.validator.addMethod("gmailGoogle", function (value, element) {
        // Kiểm tra định dạng của chuỗi nhập vào bằng biểu thức chính quy
        return this.optional(element) || /^.+@gmail\.com$/.test(value);
    }, "Đây không phải là gmail");
    $.validator.addMethod("minAge", function (value, element, min) {
        var myDate = $('[name=dateOfBirth]').val();
        var chunks = myDate.split('-');
        var formattedDate = chunks[1] + '-' + chunks[0] + '-' + chunks[2];
        var today = new Date();
        var birthDate = new Date(formattedDate);
        var age = today.getFullYear() - birthDate.getFullYear();

        if (age > min + 1) {
            return true;
        }

        var m = today.getMonth() - birthDate.getMonth();

        if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
            age--;
        }

        return age >= min;
    }, "You are not old enough!");


    $.validator.addMethod("uniqueUserName", function (value, element) {
        return validateUserDetails("userName", "userName");
    }, "Đã tồn tại user name này !");

    $.validator.addMethod("uniquePhone", function (value, element) {
        return validateUserDetails("phoneNumber", "phone");
    }, "Đã tồn tại số điện thoại này này !");

    $.validator.addMethod("uniqueGmail", function (value, element) {
        return validateUserDetails("email", "email");
    }, "Đã tồn tại gmail này !");

    function validateUserDetails(name, inputname) {
        var bool = false;
        var inputstr = "input[name=" + inputname + "]";
        $.ajax({
            url: 'http://localhost:8080/Banana/admin/employee/checkEmp/',
            type: 'GET',
            async: false,
            dataType: 'json',
            data: {
                strCheck: $(inputstr).val(),
                name: name
            },
            success: function (data) {
                // Which is totally correct!
                if (data !== true) {
                    bool = true;
                }
            }
        });

        return bool;
    }
</script>
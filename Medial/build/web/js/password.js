    $(function () {
        $("#btnSubmit").click(function () {
            var password = $("#input-password").val();
            var confirmPassword = $("#input-confirm").val();
            if (password !== confirmPassword) {
                alert("Passwords do not match.");
                return false;
            }
            return true;
        });
    });
var SearchBarInit = function () {
    var searchBar = mdc.textField.MDCTextField.attachTo($("#SearchBar")[0]);
    var searchButton = mdc.ripple.MDCRipple.attachTo($("#SearchButton")[0]);
    $("#Search").bind({
        "click": function () {
            if ($("#SearchBar").css("display") === "none") {
                $("#SearchBar").show();
            } else if ($("#SearchBar").css("display") !== "none") {
                $("#SearchBar").hide();
            }
        }
    });
    $("#SearchButton").bind({
        "click": function () {
            window.location.href = "Search?VideoName=" + $("#SearchText").val();
        }
    });
};
function initMDCComponentAttachTo(chooser, MDCComponent) {
    var MDCComponents = [];
    $.makeArray($(chooser)).forEach(function (value) {
        MDCComponents.push(MDCComponent.attachTo(value));
    });
    MDCComponents.forEach(function (value) {
        value.useNativeValidation = false;
    });
    return MDCComponents;
}

function initMDCComponentClass(chooser, MDCComponentClass) {
    var MDCComponents = [];
    $.makeArray($(chooser)).forEach(function (value) {
        MDCComponents.push(new MDCComponentClass(value));
    });
    return MDCComponents;
}
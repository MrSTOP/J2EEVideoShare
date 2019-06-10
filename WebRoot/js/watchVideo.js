var isFirst = true;
var comment;
var isFavorite = false;
$(function () {
    $(document).ready(function () {
        var commentEditor;
        var dialogs = initMDCComponentClass(".mdc-dialog", mdc.dialog.MDCDialog);
        var iconButtonToggles = initMDCComponentAttachTo(".mdc-icon-button", mdc.iconButton.MDCIconButtonToggle);
        iconButtonToggles[0].listen("MDCIconButtonToggle:change", function () {
            $.func.videoPage_changeFavorite(iconButtonToggles[0]);
            iconButtonToggles[0].on = isFavorite;
        });
        $.func.videoPage_isFavorite(iconButtonToggles[0]);
        // $.func.videoPage_isFavorite(iconButtonToggles[0]);
        ClassicEditor.create(document.querySelector("#CommentEditor"))
            .then(editor => {
            console.log(editor);
        $(".ck-editor").css("width", "70%");
        $(".ck-editor").css("margin", "40px auto 40px");
        commentEditor = editor;
    }).catch(error => {console.error(error)});
        $.func.videoPage_requestComment();
        $.func.videoPage_getVideoCoin();
        $("#FirstPage").bind({
            "click": function () {
                $.func.videoPage_requestComment(this);
            }
        });
        $("#PrePage").bind({
            "click": function () {
                $.func.videoPage_requestComment(this);
            }
        });
        $("#NextPage").bind({
            "click": function () {
                $.func.videoPage_requestComment(this);
            }
        });
        $("#LastPage").bind({
            "click": function () {
                $.func.videoPage_requestComment(this);
            }
        });
        $("#SubmitComment").bind({
            "click": function () {
                $.ajax({
                    url: "AddNewVideoComment",
                    data: "VideoID=" + $("#VideoID").val() +
                        "&comment=" + commentEditor.getData(),
                    type: "post",
                    success: function () {
                        commentEditor.setData("");
                        $("#InfoTitle").html("成功");
                        $("#Info").html("评论提交成功！");
                        isFirst = true;
                        $.func.videoPage_requestComment();
                        dialogs[0].open();
                    },
                    error: function () {
                        $("#InfoTitle").html("失败");
                        $("#Info").html("评论提交失败！");
                        dialogs[0].open();
                    }
                })
            }
        })
        $("#GiveVideoCoin").bind({
            "click": function () {
                $.func.videoPage_giveVideoCoin();
            }
        })
    });
});
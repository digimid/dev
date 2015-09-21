var idleTime = 0, idleInterval;

$(document).ready(function () {
    $(document).foundation();

    addVerticalTabCover();

    $(window).resize(function () {
        addVerticalTabCover();
    });

    function addVerticalTabCover() {
        if ($('.tabs.vertical').length) {
            if ($('.vertical-tab-cover').length) {
                $('.vertical-tab-cover').remove();
            }
            $('<div class="vertical-tab-cover"></div>').insertAfter('.tabs.vertical dd.active a, .tabs.vertical .tab-title.active a')
            $('.vertical-tab-cover').css('left', String($('.tabs.vertical .tab-title').first().width() + 5) + 'px');
            $('.vertical-tab-cover').css('top', String($('.tabs.vertical dd.active a, .tabs.vertical .tab-title.active a').position().top + 1) + 'px');
        }
    }

    if ($('.tabs.vertical').length) {
        $('.tabs.vertical .tab-title a').click(function (e) {
            addVerticalTabCover();
        });
    }

    idleInterval = setInterval(timerIncrement, 1200000); // 20 minutes

    //Zero the idle timer on mouse movement.
    $(this).mousemove(function (e) {
        idleTime = 0;
    });
    $(this).keypress(function (e) {
        idleTime = 0;
    });

});

function timerIncrement() {
    idleTime = idleTime + 1;
    if (idleTime >= 20) { // 20 minutes
        clearInterval(idleInterval);
        //window.location.reload();
        window.location.replace("/Account/Login");
    }
}